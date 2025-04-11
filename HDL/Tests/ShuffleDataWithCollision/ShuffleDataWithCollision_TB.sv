module ShuffleDataWithCollision_TB ();

logic clk, resetn, test_pass, equal, equal_collision;
localparam NUMBER_OF_GATES = 1;
localparam DATA_SIZE = 15 * 5;
AXI4S #(.DATA_WIDTH(DATA_SIZE))  source(), out();
AXI4S #(.DATA_WIDTH(1))  collision();
///////////////////////////////////////////////////
// Input Source
///////////////////////////////////////////////////
localparam DATA_WIDTH = DATA_SIZE;
localparam INPUT_DATA_LIMIT        = (1 << DATA_WIDTH) - 1;
localparam INPUT_DATA_ADDR_WIDTH   = $clog2(INPUT_DATA_LIMIT);
localparam INPUT_DATA_SOURCE_FILE = "streamInput.hex";
AXISSource #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(INPUT_DATA_ADDR_WIDTH),
  .LIMIT(INPUT_DATA_LIMIT),
  .SOURCE_FILE(INPUT_DATA_SOURCE_FILE)
) input_source (
  .clk(clk),
  .resetn(resetn),
  .out(source)
);

///////////////////////////////////////////////////
// Design
///////////////////////////////////////////////////
logic [31:0] seeds [0:1];

ShuffleDataWithCollisionWrapper dut (
  .clk(clk),
  .resetn(resetn),
  .seeds(seeds),
  .out(out),
  .collision(collision),
  .in(source) 
);

///////////////////////////////////////////////////
// Output comparrison
///////////////////////////////////////////////////
localparam GATE_OUTPUT_LIMIT      = (1 << DATA_WIDTH) - 1;
localparam GATE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam GATE_OUTPUT_SOURCE_FILE = "referenceStream.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(DATA_WIDTH),
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

///////////////////////////////////////////////////
// Collision comparrison
///////////////////////////////////////////////////
localparam COLLIDE_OUTPUT_LIMIT      = (1 << DATA_WIDTH) - 1;
localparam COLLIDE_OUTPUT_ADDR_WIDTH = $clog2(GATE_OUTPUT_LIMIT);
localparam COLLIDE_OUTPUT_SOURCE_FILE = "collision.hex";

AXISReferenceComparator #(
  .DATA_WIDTH(1),
  .ADDR_WIDTH(COLLIDE_OUTPUT_ADDR_WIDTH),
  .NAME("Collide"),
  .LIMIT(COLLIDE_OUTPUT_LIMIT),
  .SOURCE_FILE(COLLIDE_OUTPUT_SOURCE_FILE)
) collide_comparator (
  .clk(clk),
  .resetn(resetn),
  .test_pass(equal_collision),
  .in(collision) 
);

assign test_pass = equal & equal_collision;

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
  $dumpfile("ShuffleDataWithCollision-wave.vcd"); 
  $dumpvars (0, ShuffleDataWithCollision_TB);
end

initial
begin
  clk = 0;
  resetn = 0;
  seeds[0] = 32'd345668;
  seeds[1] = 32'd12332;

  #10 resetn = 1;

#105000 $finish();
end



endmodule