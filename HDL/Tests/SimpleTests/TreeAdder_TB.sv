`ifndef TREE_ADDER_TB
 `define TREE_ADDER_TB

`ifndef PACKED_TO_UNPACKED_CONVERTER
`define PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) \
  genvar ITERATOR; \
  for ( ITERATOR = 0; ITERATOR < SIZE; ITERATOR ++) \
  assign DEST[ITERATOR] = SOURCE[ITERATOR]; 

`define UNPACKED_TO_PACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) `PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR)
`endif


module TreeAdder_TB ();
localparam DATA_WIDTH = 6;
typedef struct {
    logic [9:0] [DATA_WIDTH - 1:0] Mod_Array;
    logic [DATA_WIDTH - 1:0] sum;
} TestCase;

logic clk, resetn;
TestCase tc;
localparam SIZE = 10;

logic [SIZE - 1:0] [DATA_WIDTH - 1:0] Mod_Array;
localparam logic signed [DATA_WIDTH - 1:0] MOD_ARRAY [SIZE - 1:0] = {1, 2, 4, -3, 5, -1, -2, -4, 3, -5};

`UNPACKED_TO_PACKED_CONVERTER(MOD_ARRAY, Mod_Array, SIZE, i)

AXI4S #(.DATA_WIDTH(DATA_WIDTH)) out();
AXI4S #(.DATA_WIDTH(DATA_WIDTH * SIZE)) in();

TreeAdder #(
  .DATA_WIDTH(DATA_WIDTH),
  .ARRAY_SIZE(SIZE)
) dut (
  .clk(clk),
  .resetn(resetn),
  .out(out),
  .in(in) 
);

assign in.data = tc.Mod_Array;

always #5 clk = ~clk;

valid_output: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            $rose(out.valid)  |->  (tc.sum == out.data)        // expression to check
        )
    else 
    begin
    $error("Assertion valid_output failed! %b != %b",tc.sum, out.data);
    end

initial
begin
  $dumpfile("TreeAdder.vcd"); 
  $dumpvars (0, TreeAdder_TB);
clk = 0;
resetn = 0;
tc.Mod_Array = 0;
tc.sum = 0;
out.ready = 0;
in.valid = 0;

#5;
resetn = 1;
in.valid = 1;
out.ready = 1;

#20;
tc.Mod_Array = Mod_Array;
tc.sum = 0;
in.valid = 0;
#10;
in.valid = 1;

#10;
in.valid = 0;
#30;
tc.Mod_Array = {6'd1 , 6'd1, 6'd1, 6'd1, 6'd1, 6'd1, 6'd1, 6'd1, 6'd1, 6'd1};
tc.sum = 10;
#20;
in.valid = 1;

#50;
$finish;
end

endmodule

`endif