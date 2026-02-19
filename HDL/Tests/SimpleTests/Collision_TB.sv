module RowCollisionCheck_TB ();

typedef struct packed {
    ShufflePkg::ActiveWire target;
    ShufflePkg::ActiveWire control_1;
    ShufflePkg::ActiveWire control_2;
    logic collide;
} TestCase;

logic clk, resetn;
TestCase tc;
logic collisionDetected;

RowCollisionCheck dut (
  .target(tc.target),
  .control_1(tc.control_1),
  .control_2(tc.control_2),
  .collisionDetected(collisionDetected)
);

always #5 clk = ~clk;

collide_matches_test: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            tc.collide  |->  collisionDetected          // expression to check
        )
    else 
    begin
    $error("Assertion collide_matches_test failed! %b != %b",collisionDetected, tc.collide);
    end

initial
begin

clk = 0;
resetn = 0;
tc.target = 0;
tc.control_1 = 0;
tc.control_2 = 0;
tc.collide = 0;

#5;
resetn = 1;
tc.target.present = 1;
tc.target.position = 0;
tc.control_1.present = 1;
tc.control_1.position = 0;
tc.control_2.present = 1;
tc.control_2.position = 0;
tc.collide = 1;

#10;
tc.target.present = 1;
tc.target.position = 0;
tc.control_1.present = 1;
tc.control_1.position = 1;
tc.control_2.present = 1;
tc.control_2.position = 2;
tc.collide = 0;

#10;
$finish;

end


endmodule