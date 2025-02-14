`ifndef AXIS_FIFO
 `define AXIS_FIFO

`default_nettype none

package FIFOPkg;

typedef enum logic { 
  DATA_AND_LAST,
  DATA_ONLY
} FIFO_MODES;

endpackage

module AXISFIFO #(
  parameter DATA_WIDTH = 16,
  parameter FIFOPkg::FIFO_MODES MODE = FIFOPkg::DATA_ONLY, 
  parameter STORE_SIZE = 8
)(
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
///////////////////////////////////////////////////////////////////////
// Store and data management
///////////////////////////////////////////////////////////////////////
localparam STORE_DATA_WIDTH = (MODE == FIFOPkg::DATA_AND_LAST) ? DATA_WIDTH + 1 : DATA_WIDTH;
logic [STORE_DATA_WIDTH - 1:0] store [STORE_SIZE - 1:0];
logic [STORE_DATA_WIDTH - 1:0] in_data;
logic [STORE_DATA_WIDTH - 1:0] out_data;

generate;
if (MODE == FIFOPkg::DATA_AND_LAST)
begin
// in
assign in_data = {in.data,in.last};
//out
assign out.data = out_data[STORE_DATA_WIDTH - 1: 1];
assign out.last = out_data[0];
end
else
begin

assign in_data = in.data;
assign out.data = out_data;
end
endgenerate;

localparam STORE_WIDTH = $clog2(STORE_SIZE);
logic [STORE_WIDTH:0] write_pointer;
logic [STORE_WIDTH:0] read_pointer, read_pointer_next;
logic full, empty;


///////////////////////////////////////////////////////////////////////
// Variable for book keeping
///////////////////////////////////////////////////////////////////////

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
    store[write_pointer[STORE_WIDTH - 1:0]] <= in_data;
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
assign read_pointer_next =  ~empty ? read_pointer + out.ready : read_pointer;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  read_pointer <= read_pointer_next;
end
else
begin
  read_pointer <= 0;
end
end

assign out.valid = (~empty);
assign out_data = store[read_pointer[STORE_WIDTH - 1:0]];

endmodule


`endif