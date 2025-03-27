`ifndef AXIS_SOURCE_SV
 `define AXIS_SOURCE_SV

`include "AXIS.sv"

module AXISSource #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 10,
  parameter LIMIT      = (1<<ADDR_WIDTH),
  parameter TOGGLE_VALID = 0,
  parameter SOURCE_FILE = "source.hex"
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);

///////////////////////////////////////////////////////////////////////
// Load the file into memory
///////////////////////////////////////////////////////////////////////
logic toggle;
localparam MEMORY_WIDTH = (1<<ADDR_WIDTH) - 1;
localparam KEEP_WIDTH = (DATA_WIDTH + 7)/8;
// logic [DATA_WIDTH - 1:0] data [MEMORY_WIDTH - 1:0];
typedef logic [DATA_WIDTH - 1:0] data_type;
typedef data_type file_data[$];
file_data data;
function automatic file_data get_file_lines(string file_name);
      int fd;
      data_type value; 
      fd = $fopen(file_name, "r");
      if (fd)  begin
          $display("File %s was opened successfully", file_name);
          while ($fscanf(fd,"%x",value) > 0)
              get_file_lines.push_back(value);
      end else begin     
          $display("File %s was NOT opened successfully", file_name);
      end
      $display("File %s is closed", file_name);
      $fclose(fd);
  endfunction : get_file_lines
initial 
begin
  data = get_file_lines(SOURCE_FILE);
  $display("data size is ", data.size());
end

///////////////////////////////////////////////////////////////////////
// reading the data
///////////////////////////////////////////////////////////////////////
logic [ADDR_WIDTH:0] read_pointer;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if ((read_pointer < data.size()) & (out.ready) & (out.valid))
    read_pointer <= read_pointer + 1;
end
else
begin
  read_pointer <= 0;
end
end

///////////////////////////////////////////////////////////////////////
// Toggle control
///////////////////////////////////////////////////////////////////////
if (TOGGLE_VALID == 1)
begin
  always_ff @ (posedge clk)
  begin
  toggle = $random();
  end
end
else
begin
  assign toggle = 1;
end

///////////////////////////////////////////////////////////////////////
// sending the data out
///////////////////////////////////////////////////////////////////////
always_comb 
begin
out.valid = (read_pointer <= (data.size() - 1)) & resetn & toggle;
out.data  = data[read_pointer];
out.last  = (read_pointer == (data.size() - 1));
out.keep  = ((1 << KEEP_WIDTH) - 1);
end

endmodule

`endif