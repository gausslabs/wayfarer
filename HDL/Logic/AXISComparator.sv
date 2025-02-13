`ifndef AXIS_COMPORATOR_SV
 `define AXIS_COMPORATOR_SV


module AXISComparator #(
  parameter TOGGLE_READY = 0, 
  parameter NAME = "out"
)(
  input wire clk,
  input wire resetn,
  AXI4S.Slave in1,
  AXI4S.Slave in2,
  output logic equal
);
logic toggle;
///////////////////////////////////////////////////////////////////////
// comparing the data
///////////////////////////////////////////////////////////////////////
assign in1.ready = in2.valid & toggle;
assign in2.ready = in1.valid & toggle;

///////////////////////////////////////////////////////////////////////
// Toggle control
///////////////////////////////////////////////////////////////////////
if (TOGGLE_READY == 1)
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


logic _equal;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (in1.valid & in2.valid & toggle)
  begin
    if(in1.data == in2.data)
        _equal <= _equal & 1;
    else
        _equal <= _equal & 0;
    $display("(%s)[First Input](%d) == (%d)[Second Input], equal %b",NAME, in1.data, in2.data, (in1.data == in2.data));
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