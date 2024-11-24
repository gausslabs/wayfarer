`ifndef AXIS_SOURCE_SV
 `define AXIS_SOURCE_SV

// `include "AXIS.sv"

module AXISSource #(
  parameter DATA_WIDTH = 32,
  parameter SOURCE_FILE = "source.hex"
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);


endmodule

`endif