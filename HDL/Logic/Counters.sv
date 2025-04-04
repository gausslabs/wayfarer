`ifndef COUNTERS
 `define COUNTERS


module AXISCounter #(
    parameter DATA_WIDTH = 8,
    parameter LIMIT = (1 << DATA_WIDTH) - 1 
) (
  input wire clk,
  input wire resetn,
  output logic done,
  AXI4S.Master out
);
////////////////////////////////////////////////////////////////
// Internal nets
////////////////////////////////////////////////////////////////
logic [DATA_WIDTH:0] next_count;
logic [DATA_WIDTH - 1:0] count;

assign done = next_count > LIMIT;

assign next_count = count + 1;

always_ff @ (posedge clk)
begin
if(resetn)
begin
    if (out.ready & (next_count <= LIMIT))
        count <= next_count[DATA_WIDTH - 1:0];
end
else
begin
  count <= 0;
end
end

////////////////////////////////////////////////////////////////
// Protocol management
////////////////////////////////////////////////////////////////
assign out.valid = resetn & (~done);
assign out.last = (count == LIMIT);
assign out.data = count;


endmodule

module AXISCounterWithMask #(
    parameter TOTAL_WIDTH = 11,
    parameter MASK = 0,
    parameter DATA_WIDTH = 8,
    parameter LIMIT = (1 << DATA_WIDTH) - 1 
) (
  input wire clk,
  input wire resetn,
  output logic done,
  AXI4S.Master out
);
////////////////////////////////////////////////////////////////
// Internal nets
////////////////////////////////////////////////////////////////
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) internal();

AXISCounter #(
    .DATA_WIDTH(DATA_WIDTH),
    .LIMIT(LIMIT)
) counter (
  .clk(clk),
  .resetn(resetn),
  .done(done),
  .out(internal)
);

localparam MASK_WIDTH = TOTAL_WIDTH - DATA_WIDTH;

if (MASK_WIDTH > 0)
begin
typedef logic [MASK_WIDTH - 1:0] MaskType;
assign out.data = {MaskType'(MASK), internal.data};

end
else 
begin
assign out.data = internal.data;    
end

////////////////////////////////////////////////////////////////
// Protocol management
////////////////////////////////////////////////////////////////
assign out.valid = internal.valid;
assign out.last = internal.last;
assign internal.ready = out.ready;

endmodule

module SimpleCounter #(
  parameter COUNTER_WIDTH = 8
) (
  input wire clk,
  input wire resetn,
  input wire enable,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (enable)
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign count = counter[COUNTER_WIDTH - 1:0];


endmodule

`endif