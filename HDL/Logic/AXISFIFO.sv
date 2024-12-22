`ifndef AXIS_FIFO
 `define AXIS_FIFO

module AXISFIFO (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Store and Variable for book keeping
///////////////////////////////////////////////////////////////////////
logic [WIRE_WIDTH - 1:0] store [STORE_WIDTH - 1:0];
logic [STORE_WIDTH:0] writePointer;
logic [STORE_WIDTH:0] readPointer;
logic full, empty;

assign full = (writePointer[STORE_WIDTH] ^ readPointer[STORE_WIDTH]) & (writePointer[STORE_WIDTH - 1:0] == readPointer[STORE_WIDTH - 1:0]);
assign empty = (writePointer[STORE_WIDTH] == readPointer[STORE_WIDTH]) & (writePointer[STORE_WIDTH - 1:0] == readPointer[STORE_WIDTH - 1:0]);

///////////////////////////////////////////////////////////////////////
// Writing
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  writePointer <= writePointer + in.valid;
end
else
begin
  writePointer <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (in.valid & (~full)) 
    store[writePointer] <= in.data;
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
  readPointer <= readPointer + out.ready;
end
else
begin
  readPointer <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  out.valid = (~empty);
  if (out.ready) 
    out.data <= store[readPointer];
end
else
begin
  out.data <= 0;
  out.valid <= 0;
end
end

endmodule


`endif