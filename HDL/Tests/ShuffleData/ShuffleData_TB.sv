module ShuffleData_TB ();

logic clk, resetn, test_pass, equal;
localparam NUMBER_OF_GATES = 1;
localparam DATA_SIZE = 15*5;
AXI4S #(.DATA_WIDTH(DATA_SIZE))  source(), configuration(), out();
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam INPUT_DATA_WIDTH       = DATA_SIZE;
localparam INPUT_DATA_LIMIT       = (1 << INPUT_DATA_WIDTH) - 1;
localparam INPUT_DATA_ADDR_WIDTH  = $clog2(INPUT_DATA_LIMIT);
localparam INPUT_DATA_SOURCE_FILE = "streamInput.hex";
AXISSource #(
  .DATA_WIDTH(INPUT_DATA_WIDTH),
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
localparam INPUT_CONFIG_LIMIT        = 10;
localparam INPUT_CONFIG_ADDR_WIDTH   = $clog2(INPUT_CONFIG_LIMIT);
localparam INPUT_CONFIG_SOURCE_FILE = "config.hex";
AXISSource #(
  .DATA_WIDTH(StreamSelectionPkg::CONFIG_DATA_WIDTH),
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
logic [31:0] seeds [0:1];

ShuffleDataWrapper dut (
  .clk(clk),
  .resetn(resetn),
  .seeds(seeds),
  .out(out),
  .in(source) 
);

///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = (1 << INPUT_DATA_WIDTH) - 1;
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam GATE_OUTPUT_SOURCE_FILE = "referenceStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(INPUT_DATA_WIDTH),
  .ADDR_WIDTH(GATE_OUTPUT_ADDR_WIDTH),
  .NAME("GATE"),
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
  $dumpfile("ShuffleData-wave.vcd"); 
  $dumpvars (0, ShuffleData_TB);
end

initial
begin
  clk = 0;
  resetn = 0;
  seeds[0] = 32'd345668;
  seeds[1] = 32'd12332;

  #10 resetn = 1;

#26ms $finish();
end



endmodule