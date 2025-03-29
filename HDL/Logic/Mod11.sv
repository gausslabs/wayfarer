`ifndef MOD_11
 `define MOD_11

module Mod11 (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
initial
begin
  input_size: assert ($bits(in.data) == 10)
    else
    begin
    $error("Assertion input_size failed for mod 11!");
    $finish;
    end
end

localparam DATA_WIDTH = 6;
localparam logic signed [DATA_WIDTH - 1:0] MOD_ARRAY [0:9] = {1, 2, 4, -3, 5, -1, -2, -4, 3, -5};

logic [9:0] [DATA_WIDTH - 1:0] mod_data;

genvar i;
for (i=0; i<=9; i++) 
begin
    assign mod_data[i] = in.data[i] ? MOD_ARRAY[i] : 0;    
end

AXI4S #(.DATA_WIDTH(DATA_WIDTH)) mod_out();
AXI4S #(.DATA_WIDTH(DATA_WIDTH * 10)) mod_in();

assign in.ready = mod_in.ready;
assign mod_in.valid = in.valid;
assign mod_in.data = mod_data;

TreeAdder #(
  .DATA_WIDTH(DATA_WIDTH),
  .ARRAY_SIZE(10)
) adder (
  .clk(clk),
  .resetn(resetn),
  .out(mod_out),
  .in(mod_in) 
);

assign mod_out.ready = out.ready;
always_ff @ (posedge clk)
begin
if(resetn)
begin
    if (out.ready)
    begin
        out.valid <= mod_out.valid;
        out.data[DATA_WIDTH - 1:0] <= $signed(mod_out.data) < 0 ? ($signed(mod_out.data) < -6'd11 ? mod_out.data + 6'd22 : mod_out.data + 6'd11 ) : (mod_out.data >= 6'd11 ? mod_out.data - 6'd11 : mod_out.data);
        out.last <= mod_out.last;
    end
end
else
begin
  out.valid <= 0;
  out.data <= 0;
  out.last <= 0;
end
end

endmodule


`endif