`ifndef LFSR_TB_SV
 `define LFSR_TB_SV

`include "LFSRWrapper.sv"

module LFSR_TB ();

logic clk, resetn, test_pass;
localparam DATA_WIDTH = 8;
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) _randomNumber();
parameter bit [7:0] SEED = 63;

LFSRWrapper #(
    .SEED(SEED)
) dut (
  .clk(clk),
  .resetn(resetn),
  .out(_randomNumber)
);


localparam ADDR_WIDTH = 8;
localparam LIMIT      = (1<<ADDR_WIDTH) - 1;
localparam SOURCE_FILE = "source.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH),
  .LIMIT(LIMIT),
  .SOURCE_FILE(SOURCE_FILE)
) comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(test_pass),
  .in(_randomNumber) 
);

///////////////////////////////////////////////////
// Running the test
///////////////////////////////////////////////////

always #5 clk = ~clk;

always_ff @(posedge clk)
begin
  if (resetn)
  begin
    assert (test_pass == 1) 
    else 
    begin
      $error("Test Failed");
      $finish();
    end
  end
end

initial
begin
  $dumpfile("wave1.vcd"); 
  $dumpvars (0);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

  #1000 $finish();
end


endmodule


`endif