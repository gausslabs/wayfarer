`ifndef AGENT_CONFIG_STORE
 `define AGENT_CONFIG_STORE

module ReferenceConfigExtraction #(
    type type_of_store = AgentPkg::GateConfigStore,
    type input_data_type = StreamSelectionPkg::AgentConfig,
    parameter ADDR_SIZE = AgentPkg::GATE_CONFIG_COUNT_SIZE
)(
  input  wire       clk,
  input  wire       resetn,
  output logic      validOut,
  output type_of_store out,
  AXI4S.Slave       in 
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
logic [ADDR_SIZE -1 :0] addr;
input_data_type inData;
assign in.ready = resetn;
assign inData = in.data;

Counter #(
  .COUNTER_WIDTH(ADDR_SIZE)
) address_counter (
  .clk(clk),
  .resetn(resetn),
  .enable(in.valid),
  .count(addr)
);

/////////////////////////////////////////////////////////////////
// values beign stored
/////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  // When values are being loaded the config is in valid
  validOut <= ~in.valid;
  if (in.valid)
    out.data[addr] <= inData.data;
end
else
begin
  validOut <= 0;
end
end


endmodule

module Counter #(
  parameter COUNTER_WIDTH = 8
) (
  input wire clk,
  input wire resetn,
  input wire enable,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (enable)
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign count = counter[COUNTER_WIDTH - 1:0];


endmodule

`endif