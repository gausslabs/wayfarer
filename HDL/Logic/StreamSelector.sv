`ifndef STREAM_SELECTOR
 `define STREAM_SELECTOR

/////////////////////////////////////////////////////////////////
// StreamSelectBasedOnType will always pass values that are
// SELECTION_VALUE
/////////////////////////////////////////////////////////////////
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

/////////////////////////////////////////////////////////////////
// StreamSelectBasedOnIDRange will always pass values that are
// in  the range [LOWER_LIMIT, UPPER_LIMIT] or the id is 0.
// O is treated as a broadcast message.
/////////////////////////////////////////////////////////////////
module StreamSelectBasedOnIDRange #(
    type data_type = StreamSelectionPkg::StreamData,
    type id_type   = StreamSelectionPkg::agentID,
    parameter id_type UPPER_LIMIT = id_type'(2),
    parameter id_type LOWER_LIMIT = id_type'(1)
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
assign out.valid = in.valid & ((value.id >= LOWER_LIMIT | value.id <= UPPER_LIMIT) | value.id == id_type'(0));
assign out.data = value;
assign out.keep  = in.keep;
assign out.last  = in.last;


endmodule

/////////////////////////////////////////////////////////////////
// StreamDataExtractionBasedOnID will always pass data for
// inputs whose id's are equal to SELECTION_VALUE or 0.
// O is treated as a broadcast message.
/////////////////////////////////////////////////////////////////
module StreamDataExtractionBasedOnID #(
    type data_type = StreamSelectionPkg::StreamData,
    type id_type   = StreamSelectionPkg::agentID,
    parameter id_type SELECTION_VALUE = 'd2
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
assign out.valid = in.valid & (value.id == SELECTION_VALUE | value.id == '0) ;
assign out.data = value.data;
assign out.keep  = in.keep;
assign out.last  = in.last;


endmodule


module StreamDeMux #(
  parameter TOTAL_OUTPUT_STREAM = 6,
  parameter SELECTION_SIZE = $clog2(TOTAL_OUTPUT_STREAM)
)(
  input wire clk,
  input wire resetn,
  AXI4S.Master out [TOTAL_OUTPUT_STREAM - 1 :0],
  input wire enableSelection,
  input wire [SELECTION_SIZE - 1:0] selection,
  AXI4S.Slave in 
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
logic select [TOTAL_OUTPUT_STREAM - 1 :0];
logic ready [TOTAL_OUTPUT_STREAM - 1 :0];

/////////////////////////////////////////////////////////////////
// select logic
/////////////////////////////////////////////////////////////////
genvar j;
for (j=0; j<TOTAL_OUTPUT_STREAM; j++) begin
  assign select[j] = (selection == j) ? enableSelection & in.valid :0;
  assign ready[j] = out[j].ready & enableSelection;
end

always_comb begin
  if (selection < TOTAL_OUTPUT_STREAM)
    in.ready = ready[selection];
  else
    in.ready = 0;
end

/////////////////////////////////////////////////////////////////
// data management
/////////////////////////////////////////////////////////////////

genvar i;
for ( i=0; i<TOTAL_OUTPUT_STREAM; i++) 
begin
  always_ff @ (posedge clk)
  begin
  if(resetn)
  begin
        out[i].valid <= select[i];
        out[i].keep <= in.keep;
        out[i].last <= in.last;
        out[i].data <= in.data;
  end
  else
  begin
      out[i].valid <= 0;
      out[i].keep <= 0;
      out[i].last <= 0;
      out[i].data <= 0;
  end
  end
end
endmodule

`endif