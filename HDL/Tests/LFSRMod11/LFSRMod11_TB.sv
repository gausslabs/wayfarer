module LFSRMod11_TB ();

logic clk, resetn, test_pass, equal;
localparam DATA_SIZE = 10;
AXI4S #(.DATA_WIDTH(DATA_SIZE))  out();

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////
LFSR10MOD11 dut (
  .clk(clk),
  .resetn(resetn),
  .seed(10'd123),
  .out(out)
);

///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = (1 << DATA_SIZE) - 1;
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam GATE_OUTPUT_SOURCE_FILE = "referenceStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(DATA_SIZE),
  .ADDR_WIDTH(GATE_OUTPUT_ADDR_WIDTH),
  .NAME("LFSR10 Mod 11"),
  .LIMIT(GATE_OUTPUT_LIMIT),
  .TOGGLE_READY(1),
  .SOURCE_FILE(GATE_OUTPUT_SOURCE_FILE)
) gate_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal),
  .in(out) 
);

assign test_pass = equal;

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
  $dumpfile("LFSRMod11-wave.vcd"); 
  $dumpvars (0, LFSRMod11_TB);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

#105000 $finish();
end



endmodule