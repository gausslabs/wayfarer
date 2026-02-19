`ifndef SAFE_WIRE_TB
 `define SAFE_WIRE_TB

module SafeWireConfig_TB ();

localparam DATA_WIDTH = 10;
typedef struct {
    ShufflePkg::ActiveWire wires [0:2];
    logic sample;
    logic valid_config;
} TestCase;

logic clk, resetn, valid_wires, collision;
AgentPkg::GateConfig wires;
TestCase tc;


SafeWireConfig dut (
  .clk(clk),
  .resetn(resetn),
  .sample(tc.sample),
  .validConfig(tc.valid_config),
  .activeWires(tc.wires),
  .validPermutation(valid_wires),
  .wires(wires),
  .seed(10'd123) 
);

assign collision = AgentPkg::gate_collision(wires);

always #5 clk = ~clk;

valid_output_gate_config: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            (valid_wires)  |->  (collision == 1'b0)    // expression to check
        )
    else 
    begin
    $error("Assertion valid_output_gate_config failed! %b ", wires);
    end


initial
begin
  $dumpfile("SafeWireConfig.vcd"); 
  $dumpvars (0, SafeWireConfig_TB);
clk = 0;
resetn = 0;
tc.sample = 0;
tc.valid_config = 0;
tc.wires[0].present = 0;
tc.wires[0].position = 0;
tc.wires[1].present = 0;
tc.wires[1].position = 0;
tc.wires[2].present = 0;
tc.wires[2].position = 0;

#25;
resetn = 1;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 0;
tc.wires[0].position = 0;
tc.wires[1].present = 1;
tc.wires[1].position = 2;
tc.wires[2].present = 1;
tc.wires[2].position = 3;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;
for (int i=0; i<11; ++i) begin
#150;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 1;
tc.wires[0].position = $random() %11;
tc.wires[1].present = 1;
tc.wires[1].position = $random() %11;
tc.wires[2].present = 1;
tc.wires[2].position = $random() %11;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;

#150;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 1;
tc.wires[0].position = 0;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 1;
tc.wires[2].position = 3;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;

#150;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 1;
tc.wires[0].position = $random() %11;
tc.wires[1].present = 1;
tc.wires[1].position = $random() %11;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;

#150;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 1;
tc.wires[0].position = $random() % 11;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;

#150;
tc.sample = 1;
tc.valid_config = 1;
tc.wires[0].present = 0;
tc.wires[0].position = 2;
tc.wires[1].present = 0;
tc.wires[1].position = 2;
tc.wires[2].present = 0;
tc.wires[2].position = 3;
#10;
tc.valid_config = 0;
#50;
tc.sample = 0;

#40;
end
#40;
tc.sample = 1;
//#10;
//tc.sample = 0;



#100;
$finish;
end


endmodule

`endif