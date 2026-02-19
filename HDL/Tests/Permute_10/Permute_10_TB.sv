module Permute_10_TB ();

logic clk, resetn, test_pass, equal;
AXI4S #(.DATA_WIDTH(10*5))   source(), out();
AXI4S #(.DATA_WIDTH(25))   configuration();
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam NUMBER_OF_INPUT_WIRES  = 10*5;
localparam INPUT_DATA_LIMIT       = 256;
localparam INPUT_DATA_ADDR_WIDTH  = $clog2(INPUT_DATA_LIMIT);
localparam INPUT_DATA_SOURCE_FILE = "streamInput.hex";
AXISSource #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(INPUT_DATA_ADDR_WIDTH),
  .LIMIT(INPUT_DATA_LIMIT),
  .SOURCE_FILE(INPUT_DATA_SOURCE_FILE)
) input_source (
  .clk(clk),
  .resetn(resetn),
  .out(source)
);

///////////////////////////////////////////////////
// Input 
///////////////////////////////////////////////////
localparam INPUT_CONFIG_LIMIT        = 256;
localparam INPUT_CONFIG_ADDR_WIDTH   = $clog2(INPUT_CONFIG_LIMIT);
localparam INPUT_CONFIG_SOURCE_FILE = "config.hex";
AXISSource #(
  .DATA_WIDTH(25),
  .ADDR_WIDTH(INPUT_CONFIG_ADDR_WIDTH),
  .LIMIT(INPUT_CONFIG_LIMIT),
  .SOURCE_FILE(INPUT_CONFIG_SOURCE_FILE)
  ) config_source (
  .clk(clk),
  .resetn(resetn),
  .out(configuration)
);

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////

Permute10Wrapper dut (
  .clk(clk),
  .resetn(resetn),
  .control(configuration),
  .out(out),
  .in(source) 
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = 256;
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam GATE_OUTPUT_SOURCE_FILE = "referenceStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(GATE_OUTPUT_ADDR_WIDTH),
  .NAME("Permute"),
  .LIMIT(GATE_OUTPUT_LIMIT),
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
  $dumpfile("Permute_10-wave.vcd"); 
  $dumpvars (0, Permute_10_TB);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

#11000000 $finish();
end



endmodule