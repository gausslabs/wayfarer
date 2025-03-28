`ifndef TREE_ADDER
 `define TREE_ADDER
///////////////////////////////////////////////////////
// TreeAdder works for powers of 2, and [3, 5, 11, 10]
///////////////////////////////////////////////////////
module TreeAdder #(
    parameter DATA_WIDTH = 5,
    parameter ARRAY_SIZE = 8
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
////////////////////////////////////////
// Internal nets
////////////////////////////////////////
logic [ARRAY_SIZE - 1:0][DATA_WIDTH - 1:0] in_data;

assign in_data = in.data;

if (ARRAY_SIZE == 3)
begin
assign in.ready = out.ready;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(out.ready)
  begin 
    out.data <= in_data[0] + in_data[1] + in_data[2];
    out.valid <= in.valid;
    out.last <= in.last;
  end
end
else
begin
  out.data <= 0;
  out.valid <= 0;
  out.last <= 0;
end
end
end
else if (ARRAY_SIZE == 2) 
begin

assign in.ready = out.ready;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(out.ready)
  begin 
    out.data <= in_data[0] + in_data[1];
    out.valid <= in.valid;
    out.last <= in.last;
  end
end
else
begin
  out.data <= 0;
  out.valid <= 0;
  out.last <= 0;
end
end
end
else 
begin
localparam HALF_SIZE = ARRAY_SIZE / 2;
AXI4S #(.DATA_WIDTH((ARRAY_SIZE - HALF_SIZE)*DATA_WIDTH)) upper_half_stream_in();
AXI4S #(.DATA_WIDTH((HALF_SIZE)*DATA_WIDTH)) lower_half_stream_in();
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) lower_half_stream_out(), upper_half_stream_out();

assign lower_half_stream_in.valid = in.valid;
assign lower_half_stream_in.last = in.last;
assign upper_half_stream_in.valid = in.valid;
assign upper_half_stream_in.last = in.last;

assign upper_half_stream_in.data = in_data[ARRAY_SIZE - 1:HALF_SIZE];
assign lower_half_stream_in.data = in_data[HALF_SIZE - 1 : 0];

assign in.ready = upper_half_stream_in.ready & lower_half_stream_in.ready;


TreeAdder #(
    .DATA_WIDTH(DATA_WIDTH),
    .ARRAY_SIZE(ARRAY_SIZE - HALF_SIZE)
) upper_half (
  .clk(clk),
  .resetn(resetn),
  .out(upper_half_stream_out),
  .in(upper_half_stream_in) 
);

TreeAdder #(
    .DATA_WIDTH(DATA_WIDTH),
    .ARRAY_SIZE(HALF_SIZE)
) lower_half (
  .clk(clk),
  .resetn(resetn),
  .out(lower_half_stream_out),
  .in(lower_half_stream_in) 
);

assign lower_half_stream_out.ready = out.ready ;//& upper_half_stream_out.valid;
assign upper_half_stream_out.ready = out.ready ;//& lower_half_stream_out.valid;


always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(out.ready)
  begin 
    out.data <= lower_half_stream_out.data + upper_half_stream_out.data;
    out.valid <= lower_half_stream_out.valid & upper_half_stream_out.valid;
    out.last <= lower_half_stream_out.last & upper_half_stream_out.last;
  end
end
else
begin
  out.data <= 0;
  out.valid <= 0;
  out.last <= 0;
end
end
    
end



endmodule

`endif