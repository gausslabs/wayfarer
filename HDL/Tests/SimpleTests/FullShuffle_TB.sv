`ifndef FULL_SHUFFLE_TB
 `define FULL_SHUFFLE_TB

module FullShuffle_TB ();

localparam DATA_WIDTH = $bits(ShufflePkg::WireData);
typedef struct {
    ShufflePkg::WireData wires_in;
    logic shuffle_command;
} TestCase;

logic clk, resetn, valid_shuffle, collision, valid;
TestCase tc;
ShufflePkg::WireData wires_out;

AXI4S #(.DATA_WIDTH(DATA_WIDTH)) out(), control(), target();
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) in();

assign target.data = wires_out[0];
assign control.data = wires_out[1:2];
assign target.valid = valid_shuffle;
assign control.valid = valid_shuffle;

assign in.data = tc.wires_in;

Shuffle #(
    .data_type(ShufflePkg::WireData),
    .seed_type(logic [31:0])
) shuffle_wires (
    .clk(clk),
    .resetn(resetn),
    .wires_out(wires_out),
    .wires_valid(valid_shuffle),
    .seeds('{32'hDEADBEEF, 32'hCAFEBABE}),
    .shuffle_wires(tc.shuffle_command),
    .wires(in)
);

StreamCollisionCheck #(
    .NUMBER_OF_COLUMNS(ShufflePkg::NUMBER_OF_COLUMNS)
) stream_collision_check (
    .clk(clk),
    .resetn(resetn),
    .targets(target),
    .controls(control),
    .wires(out),
    .collision(collision) 
);


always #5 clk = ~clk;

valid_output: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            out.valid  |->  (collision == 1'b0)        // expression to check
        )
    else 
    begin
    $error("Assertion collision failed! %b != 1'b0 ",collision);
    end

different_output: assert 
    property (                                  
            @(posedge clk) disable iff (~resetn)        // sampling event
            $rose(out.valid)  |->  (out.data != $past(out.data))        // expression to check
        )
    else 
    begin
    $error("Assertion different values failed! %b ",out.data);
    end

localparam int WIRE_SIZE = 4;
ShufflePkg::ActiveWire wires_2d_array [0:2][0:4];

initial
begin
  $dumpfile("FullShuffle.vcd"); 
  $dumpvars (0, FullShuffle_TB);
clk = 0;
resetn = 0;
tc.wires_in = '0;
tc.shuffle_command = 0;
out.ready = 0;
in.valid = 0;


foreach (wires_2d_array[i, j]) begin
    wires_2d_array[i][j].present = 1'b1;
    if (j != 2 )
    wires_2d_array[i][j].position = $urandom_range(0, (1 << WIRE_SIZE) - 1);
    else
    wires_2d_array[i][j].position = 3;
end

#5;
resetn = 1;
in.valid = 1;
out.ready = 1;

#50;
foreach (tc.wires_in[i, j]) begin
        tc.wires_in[j][i] = wires_2d_array[i][j];
end
tc.shuffle_command = 0;
in.valid = 0;
#10;
in.valid = 1;
tc.shuffle_command = 0;

 #10;
 in.valid = 0;
 tc.shuffle_command = 1;
 #50;
 tc.shuffle_command = 0;
 #20;
 tc.shuffle_command = 1;
 #50;
 tc.shuffle_command = 0;
 #20;
 tc.shuffle_command = 1;

#10us;
$finish;
end


endmodule


`endif