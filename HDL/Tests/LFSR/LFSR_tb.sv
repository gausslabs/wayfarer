`ifndef LFSR_TB_SV
 `define LFSR_TB_SV

`include "LFSRWrapper.sv"

module LFSR_TB ();

logic clk, resetn, test_pass;
AXI4S #(.DATA_WIDTH(8)) _randomNumber();
parameter bit [7:0] SEED = 45;

LFSRWrapper #(
    .SEED(SEED)
) dut (
  .clk(clk),
  .resetn(resetn),
  .out(_randomNumber)
);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 10;
parameter LIMIT      = (1<<ADDR_WIDTH);
parameter SOURCE_FILE = "source.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH),
  .LIMIT(LIMIT),
  .SOURCE_FILE(SOURCE_FILE)
) (
  .clk(clk),
  .resetn(resetn),
  .test_pass(test_pass),
  .in(_randomNumber) 
);


endmodule


`endif