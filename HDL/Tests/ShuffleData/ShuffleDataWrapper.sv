`ifndef SHUFFLE_DATA_WRAPPER
 `define SHUFFLE_DATA_WRAPPER

module ShuffleDataWrapper #(
    type data_type = ShufflePkg::ActiveWire,
    parameter CONTROL_SIZE = 10,
    parameter TARGET_SIZE = 5,
    type target_type = ShufflePkg::TargetStream,
    type control_type = ShufflePkg::ControlStream,
    type stream_type = ShufflePkg::WireData
) (
  input wire clk,
  input wire resetn,
  input wire [31:0] seeds [0:1],
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////
// Internal wires
///////////////////////////////////////////////////////////
logic valid_wires, handshake, pulse, sample;
logic [31:0] target_config, control_config;
stream_type wire_out;
///////////////////////////////////////////////////////////
// FSM Control
///////////////////////////////////////////////////////////

typedef enum logic [1:0] { 
    LOAD,
    PROCESS,
    SEND
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
  current_state <= LOAD;
end
end

assign handshake = in.valid & out.ready;

always_comb
begin
    case (current_state)
        LOAD: 
            next_state = handshake ? PROCESS : LOAD;
        PROCESS:
            next_state = valid_wires ? SEND : PROCESS;
        SEND:
            next_state = handshake ? LOAD : SEND;
        default: begin
            next_state = LOAD;
        end
    endcase
end

always_comb
begin
    case (current_state)
        LOAD: 
            begin
                in.ready = 0;
                out.valid = 0;
                pulse = 0;
                sample = 0;
            end
        PROCESS:
            begin
                in.ready = 0;
                out.valid = 0;
                pulse = 1;
                sample = 0;
            end
        SEND:
            begin
                in.ready = handshake;
                out.valid = handshake;
                pulse = 0;
                sample = handshake;
            end
        default: begin
            in.ready = 0;
            out.valid = 0;
            pulse = 0;
            sample = 0;
        end
    endcase
end

PulseGenerator valid_generator (
  .clk(clk),
  .resetn(pulse),
  .pulse(internal.valid)
);

assign internal.data = in.data;

///////////////////////////////////////////////////////////
// FSM Control
///////////////////////////////////////////////////////////

AXI4S #(.DATA_WIDTH($bits(stream_type))) internal();
AXI4S #(.DATA_WIDTH($bits(control_type))) control_out();
AXI4S #(.DATA_WIDTH($bits(target_type))) target_out();

ShuffleWires #(
    .data_type(data_type),
    .CONTROL_SIZE(CONTROL_SIZE),
    .TARGET_SIZE(TARGET_SIZE),
    .target_type(target_type),
    .control_type(control_type),
    .stream_type(stream_type)
) dut (
  .clk(clk),
  .resetn(resetn),
  .controlConfig(control_config),
  .targetConfig(target_config),
  .controlOut(control_out),
  .targetOut(target_out),
  .in(internal) 
);


LFSR32 target_lfsr (
  .clk(clk),
  .resetn(resetn),
  .next(sample),
  .seed(seeds[1]),
  .out(target_config)
);

LFSR32 control_lfsr (
  .clk(clk),
  .resetn(resetn),
  .next(sample),
  .seed(seeds[0]),
  .out(control_config)
);

assign valid_wires = control_out.valid & target_out.valid;
assign control_out.ready = (current_state == PROCESS);
assign target_out.ready = (current_state == PROCESS);

assign wire_out[0] = target_out.data;
assign wire_out[1:2] = control_out.data;

assign out.data = wire_out;

endmodule


`endif