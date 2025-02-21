module SearchCircuit_TB ();

logic clk, resetn, test_pass, equal_ref, equal_gate;
localparam STREAM_WITDH = AgentPkg::NUMBER_OF_INPUT_WIRES;
AXI4S #(.DATA_WIDTH($bits(STREAM_WITDH)))   source(), in(), passThroughIn(), passThroughOut(), out();
AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig))) configuration();
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam INPUT_DATA_LIMIT        = (1 << AgentPkg::NUMBER_OF_INPUT_WIRES);
localparam INPUT_DATA_ADDR_WIDTH   = $clog2(INPUT_DATA_LIMIT);
localparam INPUT_DATA_SOURCE_FILE = "streamInput.hex";
AXISSource #(
  .DATA_WIDTH(AgentPkg::NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(INPUT_DATA_ADDR_WIDTH),
  .LIMIT(INPUT_DATA_LIMIT / 2),
  .SOURCE_FILE(INPUT_DATA_SOURCE_FILE)
) input_source (
  .clk(clk),
  .resetn(resetn),
  .out(source)
);

///////////////////////////////////////////////////
// Input 
///////////////////////////////////////////////////
localparam INPUT_CONFIG_LIMIT        = 24;
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

Tee source_tee (
  .streamOne(passThroughIn),
  .streamTwo(in),
  .in(source)
);

SearchCircuitWrapper dut (
  .clk(clk),
  .resetn(resetn),
  .out(out),
  .passThroughOut(passThroughOut),
  .in(in),
  .passThroughIn(passThroughIn),
  .configStream(configuration)
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = (1 << AgentPkg::NUMBER_OF_INPUT_WIRES);
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam REFERENCE_OUTPUT_LIMIT      = (1 << AgentPkg::NUMBER_OF_INPUT_WIRES);
localparam REFERENCE_OUTPUT_ADDR_WIDTH = $clog2(REFERENCE_OUTPUT_LIMIT);
localparam REF_OUTPUT_SOURCE_FILE = "referenceStream.hex";
localparam GATE_OUTPUT_SOURCE_FILE = "searchStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(AgentPkg::NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(REFERENCE_OUTPUT_ADDR_WIDTH),
  .LIMIT(REFERENCE_OUTPUT_LIMIT / 2),
  .NAME("Reference"),
  .SOURCE_FILE(REF_OUTPUT_SOURCE_FILE)
) reference_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_ref),
  .in(passThroughOut) 
);

AXISReferenceComparator #(
  .DATA_WIDTH(AgentPkg::NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(GATE_OUTPUT_ADDR_WIDTH),
  .NAME("GATE"),
  .LIMIT(GATE_OUTPUT_LIMIT / 2),
  .SOURCE_FILE(GATE_OUTPUT_SOURCE_FILE)
) GATE_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_gate),
  .in(out) 
);

assign test_pass = equal_gate & equal_ref;

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
  $dumpfile("wave.vcd"); 
  $dumpvars (0, SearchCircuit_TB);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

  #55000 $finish();
end



endmodule