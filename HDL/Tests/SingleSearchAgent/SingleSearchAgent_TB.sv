`ifndef SINGLE_SEARCH_AGENT_TB
 `define SINGLE_SEARCH_AGENT_TB

module SearchAgent_TB ();

logic clk, resetn, test_pass, equal_ref;
localparam STREAM_WITDH = AgentPkg::NUMBER_OF_INPUT_WIRES;
AXI4S #(.DATA_WIDTH($bits(STREAM_WITDH)))   source(), in(), passThroughIn(), passThroughOut(), out();
AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig))) configuration();

///////////////////////////////////////////////////
// Input 
///////////////////////////////////////////////////
localparam INPUT_CONFIG_LIMIT        = 36;
localparam INPUT_CONFIG_ADDR_WIDTH   = $clog2(INPUT_CONFIG_LIMIT);
localparam INPUT_CONFIG_SOURCE_FILE = "config.hex";
AXISSource #(
  .DATA_WIDTH(StreamSelectionPkg::STREAM_DATA_WIDTH),
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

SearchAgent #(
  .id_type(StreamSelectionPkg::agentID),
  .SELECTION_VALUE('d2)
) dut (
  .clk(clk),
  .resetn(resetn),
  .result(out),
  .configStream(configuration)
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = AgentPkg::NUMBER_OF_STAGES;
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam GATE_OUTPUT_SOURCE_FILE = "result.hex";

AXISReferenceComparator #(
  .DATA_WIDTH($bits(AgentPkg::GateConfig)),
  .ADDR_WIDTH(GATE_OUTPUT_ADDR_WIDTH),
  .NAME("GATE"),
  .LIMIT(GATE_OUTPUT_LIMIT),
  .SOURCE_FILE(GATE_OUTPUT_SOURCE_FILE)
) GATE_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_ref),
  .in(out) 
);

assign test_pass = equal_ref;

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
  $dumpvars (0, SearchAgent_TB);
end

initial
begin
  clk = 0;
  resetn = 0;

  #10 resetn = 1;

  #105000 $finish();
end



endmodule

`endif