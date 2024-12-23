`ifndef FIFO_TB
 `define FIFO_TB

`include "AXISFIFO.sv"

module FIFO_TB ();

logic clk, resetn, test_pass;
localparam DATA_WIDTH = 16;
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) fifoOut(), in();

AXISFIFO #(
    .DATA_WIDTH(DATA_WIDTH)
) dut (
  .clk(clk),
  .resetn(resetn),
  .in(in),
  .out(fifoOut)
);


localparam ADDR_WIDTH = 8;
localparam LIMIT      = (1<<ADDR_WIDTH) - 1;
localparam SOURCE_FILE = "fifo.hex";

AXISSource #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH),
  .LIMIT(LIMIT),
  .SOURCE_FILE(SOURCE_FILE)
) source (
  .clk(clk),
  .resetn(resetn),
  .out(in)
);

AXISReferenceComparator #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH),
  .LIMIT(LIMIT),
  .SOURCE_FILE(SOURCE_FILE)
) comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(test_pass),
  .in(fifoOut) 
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
  $dumpfile("fifo.vcd"); 
  $dumpvars (0, FIFO_TB);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

  #1000;
  $display("Test Passed!!");
  $finish();
end


endmodule

`endif