`ifndef AXIS_SOURCE_SV
 `define AXIS_SOURCE_SV

`include "AXIS.sv"

module AXISSource #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 10,
  parameter LIMIT      = (1<<ADDR_WIDTH),
  parameter SOURCE_FILE = "source.hex"
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);

///////////////////////////////////////////////////////////////////////
// Load the file into memory
///////////////////////////////////////////////////////////////////////
localparam MEMORY_WIDTH = (1<<ADDR_WIDTH) - 1;
localparam KEEP_WIDTH = (DATA_WIDTH + 7)/8;
logic [DATA_WIDTH - 1:0] data [MEMORY_WIDTH - 1:0];
initial 
begin
  $readmemh(SOURCE_FILE, data, 0 ,LIMIT - 1);
end

///////////////////////////////////////////////////////////////////////
// reading the data
///////////////////////////////////////////////////////////////////////
logic [ADDR_WIDTH:0] read_pointer;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if ((read_pointer <= LIMIT) & (out.ready) & (out.valid))
    read_pointer <= read_pointer + 1;
end
else
begin
  read_pointer <= 0;
end
end

///////////////////////////////////////////////////////////////////////
// sending the data out
///////////////////////////////////////////////////////////////////////
// always_ff @ (posedge clk)
// begin
// if(resetn)
// begin
  assign out.valid = (read_pointer <= (LIMIT - 1)) & resetn;
  assign out.data  = data[read_pointer];
  assign out.last  = (read_pointer == (LIMIT - 1));
  assign out.keep  = ((1 << KEEP_WIDTH) - 1);
// end
// else
// begin
//   out.valid <= 0;
//   out.data <= 0;
//   out.last <= 0;
//   out.keep <= 0;
// end
// end

endmodule

`endif