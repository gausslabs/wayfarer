`ifndef AXIS_REFERENCE_COMPORATOR_SV
 `define AXIS_REFERENCE_COMPORATOR_SV

module AXISReferenceComparator #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 10,
  parameter LIMIT      = (1<<ADDR_WIDTH),
  parameter SOURCE_FILE = "source.hex"
) (
  input wire clk,
  input wire resetn,
  output logic test_pass,
  AXI4S.Slave in 
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
  if ((read_pointer <= LIMIT) & (in.valid))
    read_pointer <= read_pointer + 1;
end
else
begin
  read_pointer <= 0;
end
end

assign in.ready = resetn;

///////////////////////////////////////////////////////////////////////
// comparing the data
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(in.data == data[read_pointer])
    test_pass <= test_pass & 1;
  else
    test_pass <= test_pass & 0;
end
else
begin
  test_pass <= 1;
end
end


endmodule


`endif