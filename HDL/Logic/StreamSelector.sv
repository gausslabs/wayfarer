`ifndef STREAM_SELECTOR
 `define STREAM_SELECTOR


module StreamSelectBasedOnType #(
    type enum_type = StreamSelectionPkg::ConfigType,
    type data_type = StreamSelectionPkg::AgentConfig,
    parameter enum_type SELECTION_VALUE = StreamSelectionPkg::REFERENCE_PARAMETER
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
data_type value;
assign value = in.data;

/////////////////////////////////////////////////////////////////
// ready connection
/////////////////////////////////////////////////////////////////
assign in.ready = out.ready;

/////////////////////////////////////////////////////////////////
// data connection
/////////////////////////////////////////////////////////////////
assign out.valid = in.valid & (value.configType == SELECTION_VALUE) ;
assign out.data = value;
assign out.keep  = in.keep;
assign out.last  = in.last;


endmodule


`endif