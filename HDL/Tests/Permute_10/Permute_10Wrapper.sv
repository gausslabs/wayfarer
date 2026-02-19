`ifndef PERMUTE_10_WRAPPER
 `define PERMUTE_10_WRAPPER


module Permute10Wrapper (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in,
  AXI4S.Slave control
);

typedef logic [0:9][4:0] inData;

AXI4S #(.DATA_WIDTH($bits(inData))) _in();

assign _in.data = in.data;
assign _in.last = in.last;
assign _in.valid = in.valid & control.valid;
assign in.ready = _in.ready & control.valid;
assign control.ready = in.valid & _in.ready;


PermuteNetwork10 #(
    .data_type(ShufflePkg::ActiveWire),
    .stream_type(inData)
) wrapper_dut (
  .clk(clk),
  .resetn(resetn),
  .control(control.data),
  .out(out),
  .in(_in) 
);


endmodule


`endif