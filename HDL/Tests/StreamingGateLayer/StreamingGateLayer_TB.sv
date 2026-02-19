`ifndef STREAMING_GATE_LAYER_TB
 `define STREAMING_GATE_LAYER_TB

module StreamingGateLayer_TB ();

logic clk, resetn, test_pass, equal_source, equal_gate;

localparam NUMBER_OF_INPUT_WIRES = 5;
localparam CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES);

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gateIn(), gateOut(), pass_through_in(), pass_through_out(), reference();
logic [3:0] gateChoice;
logic [CHOICE_WIDTH - 1: 0] aSelect ,bSelect ,cSelect;
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam INPUT_ADDR_WIDTH   = NUMBER_OF_INPUT_WIRES;
localparam INPUT_LIMIT        = (1<<INPUT_ADDR_WIDTH) - 1;
localparam INPUT_SOURCE_FILE = "input.hex";
AXISSource #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(INPUT_ADDR_WIDTH),
  .LIMIT(INPUT_LIMIT),
  .SOURCE_FILE(INPUT_SOURCE_FILE)
) input_source (
  .clk(clk),
  .resetn(resetn),
  .out(reference)
);

Tee tee (
  .streamOne(gateIn),
  .streamTwo(pass_through_in),
  .in(reference)
);

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////
StreamingGate #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
  .CHOICE_WIDTH(CHOICE_WIDTH)
) dut (
  .clk(clk),
  .resetn(resetn),
  .passThrough(0),
  .gateChoice(gateChoice),
  .aSelect(aSelect),
  .bSelect(bSelect),
  .cSelect(cSelect),
  .in(gateIn),
  .passThroughIn(pass_through_in),
  .passThroughOut(pass_through_out),
  .out(gateOut)
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam OUTPUT_ADDR_WIDTH = NUMBER_OF_INPUT_WIRES;
localparam OUTPUT_LIMIT      = (1<<OUTPUT_ADDR_WIDTH) - 1;
localparam OUTPUT_SOURCE_FILE = "output.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(INPUT_ADDR_WIDTH),
  .LIMIT(INPUT_LIMIT),
  .NAME("passthrough"),
  .SOURCE_FILE(INPUT_SOURCE_FILE)
) pass_through_output_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_source),
  .in(pass_through_out) 
);

AXISReferenceComparator #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(OUTPUT_ADDR_WIDTH),
  .NAME("gateOut"),
  .LIMIT(OUTPUT_LIMIT),
  .SOURCE_FILE(OUTPUT_SOURCE_FILE)
) gate_output_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_gate),
  .in(gateOut) 
);

assign test_pass = equal_gate & equal_source;

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
  $dumpvars (0, StreamingGateLayer_TB);
end

initial
begin
  clk = 0;
  resetn = 0;
  gateChoice = 4'd9;
  aSelect = 3'd0;
  bSelect = 3'd1;
  cSelect = 3'd3;

  #10 resetn = 1;

  #1000 $finish();
end



endmodule


`endif