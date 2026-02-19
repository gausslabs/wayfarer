`ifndef MOD_11_TB
 `define MOD_11_TB

module Mod11_TB ();

localparam DATA_WIDTH = 10;
typedef struct {
    logic [DATA_WIDTH - 1:0] inp;
    logic [DATA_WIDTH - 1:0] mod;
} TestCase;

logic clk, resetn;
TestCase tc;

AXI4S #(.DATA_WIDTH(DATA_WIDTH)) out();
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) in();


Mod11 dut (
  .clk(clk),
  .resetn(resetn),
  .out(out),
  .in(in) 
);


assign in.data = tc.inp;

always #5 clk = ~clk;

valid_output: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            $rose(out.valid)  |->  (tc.mod == out.data)        // expression to check
        )
    else 
    begin
    $error("Assertion valid_output failed! %b != %b",tc.mod, out.data);
    end

initial
begin
  $dumpfile("Mod11.vcd"); 
  $dumpvars (0, Mod11_TB);
clk = 0;
resetn = 0;
tc.inp = 0;
tc.mod = 0;
out.ready = 0;
in.valid = 0;

#5;
resetn = 1;
in.valid = 1;
out.ready = 1;

#50;
tc.inp = 10'd11;
tc.mod = 0;
in.valid = 0;
#10;
in.valid = 1;

#10;
in.valid = 0;
#50;
tc.inp = 10'd123;
tc.mod = 123 % 11;
#20;
in.valid = 1;

#50;
$finish;
end


endmodule


`endif