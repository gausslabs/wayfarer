`ifndef SAFE_WIRE
 `define SAFE_WIRE

`include "AXISFIFO.sv"

module SafeWireConfig (
  input wire clk,
  input wire resetn,
  input wire validConfig,
  input wire sample,
  input wire [9:0] seed,
  input ShufflePkg::ActiveWire activeWires [0:2],
  output logic validPermutation,
  output AgentPkg::GateConfig wires
);
///////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////
ShufflePkg::ActiveWire activeWireConfig [0:2];
logic valid_sample;
logic [0:2] [3:0] wires_values;

typedef enum logic {
    IDLE,
    SAMPLE
} State;

State current_state, next_state;


always_ff @ (posedge clk)
begin
if(resetn)
begin
    if(validConfig)
    begin
        activeWireConfig[0] <= activeWires[0];
        activeWireConfig[1] <= activeWires[1];
        activeWireConfig[2] <= activeWires[2];
    end
end
else
begin
  activeWireConfig[0] <= 0;
  activeWireConfig[1] <= 0;
  activeWireConfig[2] <= 0;
end
end

///////////////////////////////////////////////////////////////////
// Setting ouptut 
///////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  wires.cSelect <= activeWireConfig[0].present ? activeWireConfig[0].position : wires_values[0];
  wires.aSelect <= activeWireConfig[1].present ? activeWireConfig[1].position : wires_values[1];
  wires.bSelect <= activeWireConfig[2].present ? activeWireConfig[2].position : wires_values[2];
end
else
begin
  wires <= 0;
end
end


///////////////////////////////////////////////////////////////////
// FSM
///////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= SAMPLE;
end
end

always_comb
begin
  case (current_state)
    SAMPLE:
        next_state = valid_sample ? IDLE : SAMPLE;
    IDLE:
        next_state = sample ? SAMPLE : IDLE;    
    default: begin
        next_state = SAMPLE;
    end
  endcase
end

assign validPermutation = (current_state == IDLE);
logic sample_pulse;
PulseGenerator pulse_generator (
  .clk(clk),
  .resetn(resetn & (current_state == SAMPLE)),
  .pulse(sample_pulse)
);

///////////////////////////////////////////////////////////////////
// PRNG Buffers 
///////////////////////////////////////////////////////////////////

SampleWires sample_wires (
  .clk(clk),
  .resetn(resetn),
  .sample(sample_pulse),
  .activeWireConfig(activeWireConfig),
  .validWires(valid_sample),
  .wires(wires_values),
  .seed(seed)
);

endmodule : SafeWireConfig

//                 ▲    ┌─────┐     
// Active          │    │     │     
// Wires  ┌────────┴────▼─┐  ┌┴────┐
// ───────►  Collision    ├──►FSM  │
//        └─▲─────▲─────▲─┘  │     │
//        ┌─┼─┐ ┌─┼─┐ ┌─┼─┐  └─────┘
//        │   │ │   │ │   │         
//        │ F │ │ F │ │ F │         
//        │ I │ │ I │ │ I │         
//        │ F │ │ F │ │ F │         
//        │ O │ │ O │ │ O │         
//        │   │ │   │ │   │         
//        └─▲─┘ └─▲─┘ └─▲─┘         
//          │     │     │           
//          │ ┌───┼──┐  │           
//          └─┼      ┼──┘           
//            └──▲───┘              
//              ┌┴─┐                
//              │L │                
//              │F │                
//              │S │                
//              │R │                
//              │  │                
//              └──┘                


module SampleWires (
  input wire clk,
  input wire resetn,
  input wire sample,
  input ShufflePkg::ActiveWire activeWireConfig [0:2],
  output logic validWires,
  output logic [0:2] [3:0] wires,
  input wire [9:0] seed
);

///////////////////////////////////////////////////////////////////
// Internal 
///////////////////////////////////////////////////////////////////
localparam DATA_WIDTH = 4;
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) lfsr_mod_11(), a_select(), b_select(), c_select();

AXI4S #(.DATA_WIDTH(DATA_WIDTH)) a_select_buffer_in(), b_select_buffer_in(), c_select_buffer_in();
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) select[2:0]();

typedef enum logic[1:0] {
    IDLE,
    SAMPLE,
    COLLISION_CHECK,
    DONE
} State;

State current_state, next_state;
ShufflePkg::ActiveWire target, control_1, control_2;
logic collisionDetected;

///////////////////////////////////////////////////////////////////
// FSM 
///////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= IDLE;
end
end

always_comb
begin
  case (current_state)
    SAMPLE:
        next_state = (c_select.valid & b_select.valid & a_select.valid) | (activeWireConfig[0].present & activeWireConfig[1].present & activeWireConfig[2].present) ? COLLISION_CHECK : SAMPLE;
    COLLISION_CHECK:
        next_state = collisionDetected ? SAMPLE : DONE;
    DONE:
        next_state = IDLE;
    IDLE:
        next_state = sample ? SAMPLE : IDLE;    
    default: begin
        next_state = IDLE;
    end
  endcase
end

assign validWires = (current_state == DONE);
logic in_collsion;
assign in_collsion = resetn ? (current_state == COLLISION_CHECK) : 0;
assign c_select.ready = in_collsion & (~activeWireConfig[0].present);
assign a_select.ready = in_collsion & (~activeWireConfig[1].present);
assign b_select.ready = in_collsion & (~activeWireConfig[2].present);

///////////////////////////////////////////////////////////////////
// Collision check 
///////////////////////////////////////////////////////////////////
assign target.present =1;
assign target.position = activeWireConfig[0].present ? activeWireConfig[0].position : c_select.data;

assign control_1.present = 1;
assign control_1.position = activeWireConfig[1].present ? activeWireConfig[1].position : a_select.data;

assign control_2.present = 1;
assign control_2.position = activeWireConfig[2].present ? activeWireConfig[2].position : b_select.data;

RowCollisionCheck collision_check (
  .target(target),
  .control_1(control_1),
  .control_2(control_2),
  .collisionDetected(collisionDetected)
);

///////////////////////////////////////////////////////////////////
// Output 
///////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
    if (current_state == COLLISION_CHECK)
    begin
        wires[0] <= target.position;
        wires[1] <= control_1.position;
        wires[2] <= control_2.position;
    end
end
else
begin
  wires[0] <= 0;
  wires[1] <= 0;
  wires[2] <= 0;
end
end

///////////////////////////////////////////////////////////////////
// Buffers 
///////////////////////////////////////////////////////////////////
AXISFIFO #(
  .DATA_WIDTH(DATA_WIDTH),
  .MODE(FIFOPkg::DATA_ONLY), 
  .STORE_SIZE(2)
) a_select_buffer (
  .clk(clk),
  .resetn(resetn),
  .out(a_select),
 .in(a_select_buffer_in) 
);

AXISFIFO #(
  .DATA_WIDTH(DATA_WIDTH),
  .MODE(FIFOPkg::DATA_ONLY), 
  .STORE_SIZE(2)
) b_select_buffer (
  .clk(clk),
  .resetn(resetn),
  .out(b_select),
 .in(b_select_buffer_in) 
);

AXISFIFO #(
  .DATA_WIDTH(DATA_WIDTH),
  .MODE(FIFOPkg::DATA_ONLY), 
  .STORE_SIZE(2)
) c_select_buffer (
  .clk(clk),
  .resetn(resetn),
  .out(c_select),
 .in(c_select_buffer_in) 
);

///////////////////////////////////////////////////////////////////
// Arbiter 
///////////////////////////////////////////////////////////////////


StreamConnector c_connect (
  .out(c_select_buffer_in),
  .in(select[0])
);

StreamConnector a_connect (
  .out(a_select_buffer_in),
  .in(select[1])
);

StreamConnector b_connect (
  .out(b_select_buffer_in),
  .in(select[2])
);


AXISArbiter3 arbiter_rr (
  .clk(clk),
  .resetn(resetn),
  .out(select),
  .in(lfsr_mod_11)
);

///////////////////////////////////////////////////////////////////
// PRNG lfsr 
///////////////////////////////////////////////////////////////////

LFSR10MOD11 prng (
  .clk(clk),
  .resetn(resetn),
  .seed(seed),
  .out(lfsr_mod_11)
);

endmodule


`endif