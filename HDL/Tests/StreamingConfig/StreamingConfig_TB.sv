`ifndef STREAMING_CONFIG_TB
 `define STREAMING_CONFIG_TB

`include "StreamingConfigWrapper.sv"

module StreamingConfig_TB ();

logic clk, resetn, test_pass, equal_source, equal_gate;

AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::StreamData))) in();
AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig))) reference(), search(), search_buffered(), reference_buffered();
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam INPUT_LIMIT        = 36;
localparam INPUT_ADDR_WIDTH   = $clog2(INPUT_LIMIT);
localparam INPUT_SOURCE_FILE = "streamInput.hex";
AXISSource #(
  .DATA_WIDTH(StreamSelectionPkg::STREAM_DATA_WIDTH),
  .ADDR_WIDTH(INPUT_ADDR_WIDTH),
  .LIMIT(INPUT_LIMIT),
  .SOURCE_FILE(INPUT_SOURCE_FILE)
) input_source (
  .clk(clk),
  .resetn(resetn),
  .out(in)
);

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////
StreamingConfigWrapper dut (
  .clk(clk),
  .resetn(resetn),
  .reference(reference),
  .search(search),
  .in(in) 
);

AXISFIFO #(
  .DATA_WIDTH(StreamSelectionPkg::CONFIG_DATA_WIDTH),
  .STORE_SIZE(4)
)search_buffer(
  .clk(clk),
  .resetn(resetn),
  .out(search_buffered),
  .in(search) 
);

AXISFIFO #(
  .DATA_WIDTH(StreamSelectionPkg::CONFIG_DATA_WIDTH),
  .STORE_SIZE(4)
)reference_buffer(
  .clk(clk),
  .resetn(resetn),
  .out(reference_buffered),
  .in(reference) 
);


///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam SEARCH_OUTPUT_LIMIT      = 24;
localparam SEARCH_OUTPUT_ADDR_WIDTH = $clog2(SEARCH_OUTPUT_LIMIT);
localparam REFERENCE_OUTPUT_LIMIT      = 12;
localparam REFERENCE_OUTPUT_ADDR_WIDTH = $clog2(SEARCH_OUTPUT_LIMIT);
localparam REF_OUTPUT_SOURCE_FILE = "referenceStream.hex";
localparam SEARCH_OUTPUT_SOURCE_FILE = "searchStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(StreamSelectionPkg::CONFIG_DATA_WIDTH),
  .ADDR_WIDTH(REFERENCE_OUTPUT_ADDR_WIDTH),
  .LIMIT(REFERENCE_OUTPUT_LIMIT),
  .NAME("Reference"),
  .SOURCE_FILE(REF_OUTPUT_SOURCE_FILE)
) reference_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_ref),
  .in(reference_buffered) 
);

AXISReferenceComparator #(
  .DATA_WIDTH(StreamSelectionPkg::CONFIG_DATA_WIDTH),
  .ADDR_WIDTH(SEARCH_OUTPUT_ADDR_WIDTH),
  .NAME("Search"),
  .LIMIT(SEARCH_OUTPUT_LIMIT),
  .SOURCE_FILE(SEARCH_OUTPUT_SOURCE_FILE)
) search_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_search),
  .in(search_buffered) 
);

assign test_pass = equal_search & equal_ref;

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
  $dumpvars (0, StreamingConfig_TB);
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