`ifndef AXIS_COMPORATOR_SV
 `define AXIS_COMPORATOR_SV


module AXISComparator (
  input wire clk,
  input wire resetn,
  AXI4S.Slave in1,
  AXI4S.Slave in2,
  output logic equal
);
///////////////////////////////////////////////////////////////////////
// comparing the data
///////////////////////////////////////////////////////////////////////
assign in1.ready = in2.valid;
assign in2.ready = in1.valid;

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
    $display("[First Input](%d) == (%d)[Second Input], equal %b", in1.data, in2.data, (in1.data == in2.data));
  end
end
else
begin
  _equal <= 1;
end
end

assign equal = _equal;

endmodule


`endif