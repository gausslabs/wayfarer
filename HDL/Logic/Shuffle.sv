`ifndef SHUFFLE
 `define SHUFFLE

`include "PermutationNetwork.sv"

module ShuffleTargets #(
    type data_type = ShufflePkg::ActiveWire,
    parameter TARGET_SIZE = 5,
    type stream_type = ShufflePkg::TargetStream
) (
  input wire clk,
  input wire resetn,
  input logic [9:0] control,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Internal Data
///////////////////////////////////////////////////////////////////////
stream_type riffle_layer, rotate_layer;

AXI4S #(.DATA_WIDTH($bits(stream_type))) network_stream(), network_stream_delayed();

///////////////////////////////////////////////////////////////////////
// Data management
///////////////////////////////////////////////////////////////////////

// `UNPACKED_TO_PACKED_CONVERTER(rotate_layer, network_stream.data, TARGET_SIZE, j)

///////////////////////////////////////////////////////////////////////
// Protocol management
///////////////////////////////////////////////////////////////////////

assign network_stream.valid = in.valid;
assign in.ready = network_stream.ready;
assign network_stream.data = rotate_layer;


///////////////////////////////////////////////////////////////////////
// Riffle & Rotate Data
///////////////////////////////////////////////////////////////////////
riffle #(
  .data_type(stream_type),
  .SIZE(TARGET_SIZE)
) riffle_data (
  .input_val(in.data),
  .output_val(riffle_layer),
  .control(control[9])
);

rotate #(
  .data_type(data_type),
  .SIZE(TARGET_SIZE)
) rotate_data (
  .input_val(riffle_layer),
  .output_val(rotate_layer),
  .control(control[8])
);

///////////////////////////////////////////////////////////////////////
// permutation network
///////////////////////////////////////////////////////////////////////

Passthrough buffer_stream (
  .clk(clk),
  .resetn(resetn),
  .out(network_stream_delayed),
  .in(network_stream)
);

PermuteNetwork5 #(
    .data_type(data_type),
    .stream_type(stream_type)
) perm_5 (
  .clk(clk),
  .resetn(resetn),
  .control(control[7:0]),
  .out(out),
  .in(network_stream_delayed)
);

endmodule : ShuffleTargets


module ShuffleControls #(
    type data_type = ShufflePkg::ActiveWire,
    parameter CONTROL_SIZE = 10,
    type stream_type = ShufflePkg::ControlStream
) (
  input wire clk,
  input wire resetn,
  input logic [26:0] control,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Internal Data
///////////////////////////////////////////////////////////////////////
stream_type riffle_layer, rotate_layer;

AXI4S #(.DATA_WIDTH($bits(stream_type))) network_stream(), network_stream_delayed();

///////////////////////////////////////////////////////////////////////
// Data management
///////////////////////////////////////////////////////////////////////

// `UNPACKED_TO_PACKED_CONVERTER(rotate_layer, network_stream.data, CONTROL_SIZE, j)

///////////////////////////////////////////////////////////////////////
// Protocol management
///////////////////////////////////////////////////////////////////////

assign network_stream.valid = in.valid;
assign in.ready = network_stream.ready;
assign network_stream.data = rotate_layer;

///////////////////////////////////////////////////////////////////////
// Riffle & Rotate Data
///////////////////////////////////////////////////////////////////////
riffle #(
  .data_type(data_type),
  .SIZE(CONTROL_SIZE)
) riffle_data (
  .input_val(in.data),
  .output_val(riffle_layer),
  .control(control[26])
);

rotate #(
  .data_type(data_type),
  .SIZE(CONTROL_SIZE)
) rotate_data (
  .input_val(riffle_layer),
  .output_val(rotate_layer),
  .control(control[25])
);

///////////////////////////////////////////////////////////////////////
// permutation network
///////////////////////////////////////////////////////////////////////

Passthrough buffer_stream (
  .clk(clk),
  .resetn(resetn),
  .out(network_stream_delayed),
  .in(network_stream)
);

PermuteNetwork10 #(
    .data_type(data_type),
    .stream_type(stream_type)
) perm_10 (
  .clk(clk),
  .resetn(resetn),
  .control(control[24:0]),
  .out(out),
  .in(network_stream_delayed)
);

endmodule : ShuffleControls

//                          ┌─────────────────────────┐                
//                          │                         │                
//     ┌────┐   ┌─────┐     │ Target Shuffle          │    ┌──────┐
//     │IN  │   │ E   ┼─────►                         ┼────► IN   │
//     │W   │   │ x   │     │                         │    │ W    │
//     │i   │   │ t   │     └─────────────────────────┘    │ i    │
// ────►r   ┼───► r   │     ┌─────────────────────────┐    │ r    ┼───►
//     │e   │   │ a   │     │                         │    │ e    │
//     │s   │   │ c   │     │ Control Shuffle         │    │ s    │
//     │    │   │ t   ┼─────►                         ┼────►      │
//     │    │   │     │     │                         │    │      │
//     └────┘   └─────┘     │                         │    └──────┘
//                          │                         │
//                          └─────────────────────────┘

module ShuffleWires #(
    type data_type = ShufflePkg::ActiveWire,
    parameter CONTROL_SIZE = 10,
    parameter TARGET_SIZE = 5,
    type target_type = ShufflePkg::TargetStream,
    type control_type = ShufflePkg::ControlStream,
    type stream_type = ShufflePkg::WireData
) (
  input wire clk,
  input wire resetn,
  input logic [35:0] control,
  output logic collision,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Internal Data
///////////////////////////////////////////////////////////////////////
stream_type in_data;
control_type control_data;

AXI4S #(.DATA_WIDTH($bits(target_type))) target_in_stream(), target_out_stream(), target_out_stream_delayed();
AXI4S #(.DATA_WIDTH($bits(control_type))) control_in_stream(), control_out_stream(), control_out_stream_delayed();

///////////////////////////////////////////////////////////////////////
// Data management
///////////////////////////////////////////////////////////////////////

assign in_data = in.data;
assign target_in_stream.data = in_data[0];
assign control_data[0] = in_data[1:2];
assign control_in_stream.data = control_data;

///////////////////////////////////////////////////////////////////////
// Protocol management
///////////////////////////////////////////////////////////////////////
assign target_in_stream.valid = in.valid;
assign control_in_stream.valid = in.valid;
assign in.ready = target_in_stream.ready & control_in_stream.ready;

///////////////////////////////////////////////////////////////////////
// Shuffle
///////////////////////////////////////////////////////////////////////

ShuffleControls #(
    .data_type(data_type),
    .CONTROL_SIZE(CONTROL_SIZE),
    .stream_type(control_type)
) shuffle_controls (
  .clk(clk),
  .resetn(resetn),
  .control(control[26:0]),
  .out(control_in_stream),
  .in(control_out_stream) 
);

ShuffleTargets #(
    .data_type(data_type),
    .TARGET_SIZE(TARGET_SIZE),
    .stream_type(target_type)
) shuffle_targets (
  .clk(clk),
  .resetn(resetn),
  .control(control[35:27]),
  .out(target_in_stream),
  .in(target_out_stream) 
);

Passthrough buffer_targets (
  .clk(clk),
  .resetn(resetn),
  .out(target_out_stream_delayed),
  .in(target_out_stream)
);

Passthrough buffer_controls (
  .clk(clk),
  .resetn(resetn),
  .out(control_out_stream_delayed),
  .in(control_out_stream)
);
///////////////////////////////////////////////////////////////////////
// Collision
///////////////////////////////////////////////////////////////////////

StreamCollisionCheck #(
  .NUMBER_OF_COLUMNS(TARGET_SIZE)
) collision_check (
  .clk(clk),
  .resetn(resetn),
  .targets(target_out_stream_delayed),
  .controls(control_out_stream_delayed),
  .wires(out),
  .collision(collision)
);


endmodule : ShuffleWires

// ┌─────────────────────────────────┐         
// │                                 │         
// │  Shuffle Wires                  ┼────────►
// │                                 │   Wires    
// │                                 │         
// └────▲──────┬───────────▲─────────┘         
// Wires│      │c          │                   
//  ┌───┼──┐   │o   ┌──────┼──────┐            
//  │FSM   │   │l   │ LFSR        │            
//  │      ◄───┘l   │             │            
//  │      │noisi   └─────────────┘            
//  └──────┘                                   

module Shuffle #(
  type data_type = ShufflePkg::WireData,
  type seed_type = logic [31:0]
) (
  input wire clk,
  input wire resetn,
  output data_type wires_out,
  output logic wires_valid,
  input seed_type seed,
  input logic shuffle_wires,
  AXI4S.Slave wires
);
///////////////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////////////
ShufflePkg::Targets target_values;
ShufflePkg::ControlData control_data;
data_type wire_data, shuffled_wires;
logic shuffled, collision;

typedef enum logic [1:0] { 
  EXTERNAL_LOAD,
  IDLE,
  SHUFFLE,
  COLLISION
} State;

State current_state, next_state;

AXI4S #(.DATA_WIDTH($bits(data_type))) collision_stream(), wire_values();

///////////////////////////////////////////////////////////////////////////
// Store wires
///////////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (current_state == EXTERNAL_LOAD)
    wire_data <= wires.data;
  else
  begin
    if (shuffled)
      wire_data <= shuffled_wires;
  end
end
else
begin
  wire_data <= 0;
end
end

assign wires_valid = (current_state == IDLE);

assign wires.ready = (current_state == EXTERNAL_LOAD);

///////////////////////////////////////////////////////////////////////////
// FSM
///////////////////////////////////////////////////////////////////////////

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
    IDLE:
      next_state = wires.valid ? EXTERNAL_LOAD : (shuffle_wires ? SHUFFLE : IDLE);
    EXTERNAL_LOAD:
      next_state = wires.valid ? EXTERNAL_LOAD : IDLE;
    SHUFFLE:
      next_state = collision_stream.valid ? (collision ? COLLISION : IDLE) : SHUFFLE;
    COLLISION:
      next_state = SHUFFLE;
    default: begin
      next_state = IDLE;
    end
  endcase
end
logic pulse;


PulseGenerator pulse_generator (
  .clk(clk),
  .resetn(resetn &(current_state == SHUFFLE)),
  .pulse(pulse)
);

assign wire_values.valid = pulse;
assign wire_values.data = wire_data;
assign shuffled = collision_stream.valid & (~collision);
assign collision_stream.ready = (current_state == SHUFFLE);
assign shuffled_wires = collision_stream.data;
///////////////////////////////////////////////////////////////////////////
// LFSR
///////////////////////////////////////////////////////////////////////////
seed_type lfsr_value;
LFSR32 lfsr (
  .clk(clk),
  .resetn(resetn & (current_state != EXTERNAL_LOAD)),
  .next((current_state == SHUFFLE) & (next_state != SHUFFLE)),
  .seed(seed),
  .out(lfsr_value)
);

///////////////////////////////////////////////////////////////////////////
// Shuffle
///////////////////////////////////////////////////////////////////////////

ShuffleWires #(
  .data_type(ShufflePkg::ActiveWire),
  .CONTROL_SIZE(10),
  .TARGET_SIZE(5),
  .target_type(ShufflePkg::TargetStream),
  .control_type(ShufflePkg::ControlStream),
  .stream_type(data_type)
) shuffle_wire_matrix (
  .clk(clk),
  .resetn(resetn &(current_state == SHUFFLE)),
  .control({lfsr_value[3:0],lfsr_value}),
  .collision(collision),
  .out(collision_stream),
 .in(wire_values)
);


endmodule : Shuffle


module PulseGenerator (
  input wire clk,
  input wire resetn,
  output logic pulse
);
///////////////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////////////
typedef enum logic { 
SEND,
DONE
} State;
State current_state, next_state;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= SEND;
end
end
///////////////////////////////////////////////////////////////////////////
// State controls
///////////////////////////////////////////////////////////////////////////
always_comb
begin
  case (current_state)
    SEND:
      next_state = resetn ? DONE : SEND;
    DONE:
      next_state = DONE;
    default: 
    begin
      next_state = SEND;
    end
  endcase

end

///////////////////////////////////////////////////////////////////////////
// outputs
////////////////////////////////////////////////////////////////////////////

assign pulse = (current_state == SEND) & resetn;

endmodule : PulseGenerator


`endif