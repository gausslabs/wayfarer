`ifndef SAFE_WIRE_TB
 `define SAFE_WIRE_TB

module SafeWire_TB ();

localparam DATA_WIDTH = 10;
typedef struct {
    ShufflePkg::ActiveWire wires [0:2];
    logic sample;
} TestCase;

logic clk, resetn, valid_wires;
logic [0:2] [0:1] collision_check;
logic [0:2] [3:0] wires;
TestCase tc;


SampleWires dut (
  .clk(clk),
  .resetn(resetn),
  .sample(tc.sample),
  .activeWireConfig(tc.wires),
  .validWires(valid_wires),
  .wires(wires),
  .seed(10'd123) 
);


assign collision_check[0][0] = (~tc.wires[0].present & (tc.wires[1].present & (wires[0] != tc.wires[1].position)) );
assign collision_check[0][1] = (~tc.wires[0].present & (tc.wires[2].present & (wires[0] != tc.wires[2].position)) );



always #5 clk = ~clk;

valid_output_position_0: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            (valid_wires & ~tc.wires[0].present)  |->  (collision_check[0][0] == tc.wires[1].present) & (collision_check[0][1] == tc.wires[2].present)      // expression to check
        )
    else 
    begin
    $error("Assertion valid_output_position_0 failed! %b != %b[wire 1], %b !=%b[wire 2]", wires[0], tc.wires[1].position, wires[0], tc.wires[2].position);
    end

assign collision_check[1][0] = (~tc.wires[1].present & (tc.wires[0].present & (wires[1] != tc.wires[0].position)) );
assign collision_check[1][1] = (~tc.wires[1].present & (tc.wires[2].present & (wires[1] != tc.wires[2].position)) );

valid_output_position_1: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            (valid_wires & ~tc.wires[1].present)  |->  (collision_check[1][0] == tc.wires[0].present) & (collision_check[1][1] == tc.wires[2].present)      // expression to check
        )
    else 
    begin
    $error("Assertion valid_output_position_1 failed! %b != %b[wire 1], %b !=%b[wire 2]", wires[1], tc.wires[0].position, wires[1], tc.wires[2].position);
    end

assign collision_check[2][0] = (~tc.wires[2].present & (tc.wires[0].present & (wires[2] != tc.wires[0].position)) );
assign collision_check[2][1] = (~tc.wires[2].present & (tc.wires[1].present & (wires[2] != tc.wires[1].position)) );

valid_output_position_2: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            (valid_wires & ~tc.wires[2].present)  |->  (collision_check[2][0] == tc.wires[0].present) & (collision_check[2][1] == tc.wires[1].present)      // expression to check
        )
    else 
    begin
    $error("Assertion valid_output_position_2 failed! %b != %b[wire 1], %b !=%b[wire 2]", wires[2], tc.wires[0].position, wires[2], tc.wires[1].position);
    end

initial
begin
  $dumpfile("SafeWire.vcd"); 
  $dumpvars (0, SafeWire_TB);
clk = 0;
resetn = 0;
tc.sample = 0;
tc.wires[0].present = 0;
tc.wires[0].position = 0;
tc.wires[1].present = 0;
tc.wires[1].position = 0;
tc.wires[2].present = 0;
tc.wires[2].position = 0;

#25;
resetn = 1;
tc.sample = 1;
tc.wires[0].present = 0;
tc.wires[0].position = 0;
tc.wires[1].present = 1;
tc.wires[1].position = 2;
tc.wires[2].present = 1;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#150;
tc.sample = 1;
tc.wires[0].present = 1;
tc.wires[0].position = 0;
tc.wires[1].present = 1;
tc.wires[1].position = 2;
tc.wires[2].present = 1;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#150;
tc.sample = 1;
tc.wires[0].present = 1;
tc.wires[0].position = 0;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 1;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#150;
tc.sample = 1;
tc.wires[0].present = 1;
tc.wires[0].position = 0;
tc.wires[1].present = 1;
tc.wires[1].position = 2;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#150;
tc.sample = 1;
tc.wires[0].present = 1;
tc.wires[0].position = 2;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#150;
tc.sample = 1;
tc.wires[0].present = 0;
tc.wires[0].position = 2;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.sample = 0;

#40;
tc.sample = 1;
//#10;
//tc.sample = 0;



#100;
$finish;
end


endmodule

`endif