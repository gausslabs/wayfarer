`ifndef AXIS_REFERENCE_COMPORATOR_SV
 `define AXIS_REFERENCE_COMPORATOR_SV

`include "AXIS.sv"

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
// reference source
///////////////////////////////////////////////////////////////////////
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) ideal();

AXISSource #(
  .DATA_WIDTH  (DATA_WIDTH ),
  .ADDR_WIDTH  (ADDR_WIDTH ),
  .LIMIT       (LIMIT      ),
  .SOURCE_FILE (SOURCE_FILE)
) reference (
  .clk   (clk   ),
  .resetn(resetn),
  .out   (ideal   )
);


///////////////////////////////////////////////////////////////////////
// comparing the data
///////////////////////////////////////////////////////////////////////

AXISComparator comparator (
  .clk   (clk      ),
  .resetn(resetn   ),
  .in1   (in       ),
  .in2   (ideal    ),
  .equal (test_pass)
);


endmodule


`endif