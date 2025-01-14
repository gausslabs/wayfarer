`ifndef AXIS_FIFO
 `define AXIS_FIFO

module AXISFIFO #(
  parameter DATA_WIDTH = 16,
  parameter STORE_SIZE = 8
)(
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Store and Variable for book keeping
///////////////////////////////////////////////////////////////////////
logic [DATA_WIDTH - 1:0] store [STORE_SIZE - 1:0];
localparam STORE_WIDTH = $clog2(STORE_SIZE);
logic [STORE_WIDTH:0] write_pointer;
logic [STORE_WIDTH:0] read_pointer;
logic full, empty;

assign full = (write_pointer[STORE_WIDTH] ^ read_pointer[STORE_WIDTH]) & (write_pointer[STORE_WIDTH - 1:0] == read_pointer[STORE_WIDTH - 1:0]);
assign empty = (write_pointer[STORE_WIDTH] == read_pointer[STORE_WIDTH]) & (write_pointer[STORE_WIDTH - 1:0] == read_pointer[STORE_WIDTH - 1:0]);

assign in.ready = ~full;
///////////////////////////////////////////////////////////////////////
// Writing
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(~full)
    write_pointer <= write_pointer + in.valid;
end
else
begin
  write_pointer <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (in.valid & (~full)) 
    store[write_pointer[STORE_WIDTH - 1:0]] <= in.data;
end
else
begin
  for (int i=0; i<(1 << STORE_WIDTH); ++i) begin
    store[i] <= 0;
  end
end
end

///////////////////////////////////////////////////////////////////////
// Reading
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(~empty)
    read_pointer <= read_pointer + out.ready;
end
else
begin
  read_pointer <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  out.valid = (~empty);
  if (out.ready) 
    out.data <= store[read_pointer[STORE_WIDTH - 1:0]];
end
else
begin
  out.data <= 0;
  out.valid <= 0;
end
end

endmodule


`endif