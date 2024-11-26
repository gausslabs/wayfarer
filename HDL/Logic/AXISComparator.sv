`ifndef AXIS_COMPORATOR_SV
 `define AXIS_COMPORATOR_SV


module AXISComparator (
  input wire clk,
  input wire resetn,
  AXI4S.Master in1,
  AXI4S.Master in2,
  output logic equal
);
///////////////////////////////////////////////////////////////////////
// comparing the data
///////////////////////////////////////////////////////////////////////
assign in1.ready = 1;
assign in2.ready = 1;

logic _equal;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (in1.valid & in2.valid)
  begin
    if(in1.data == in2.data)
        _equal <= _equal & 1;
    else
        _equal <= _equal & 0;
  end
end
else
begin
  _equal <= 1;
end
end

endmodule


`endif