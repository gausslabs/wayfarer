`ifndef GATE_LAYER_TB
 `define GATE_LAYER_TB

module GateLayer_TB ();

logic clk, resetn, test_pass;

localparam NUMBER_OF_INPUT_WIRES = 5;
localparam CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES);

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gateIn(), gateOut();
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
  .out(gateIn)
);

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////
Gate #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
  .CHOICE_WIDTH(CHOICE_WIDTH)
) dut (
  .clk(clk),
  .resetn(resetn),
  .ready(gateOut.ready),
  .readyOut(gateIn.ready),
  .validIn(gateIn.valid),
  .validOut(gateOut.valid),
  .passThrough(0),
  .gateChoice(gateChoice),
  .aSelect(aSelect),
  .bSelect(bSelect),
  .cSelect(cSelect),
  .inputWires(gateIn.data),
  .outputWires(gateOut.data)
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam OUTPUT_ADDR_WIDTH = NUMBER_OF_INPUT_WIRES;
localparam OUTPUT_LIMIT      = (1<<OUTPUT_ADDR_WIDTH) - 1;
localparam OUTPUT_SOURCE_FILE = "output.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(NUMBER_OF_INPUT_WIRES),
  .ADDR_WIDTH(OUTPUT_ADDR_WIDTH),
  .LIMIT(OUTPUT_LIMIT),
  .SOURCE_FILE(OUTPUT_SOURCE_FILE)
) output_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(test_pass),
  .in(gateOut) 
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
  $dumpvars (0, GateLayer_TB);
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