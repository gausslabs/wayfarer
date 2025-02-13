`ifndef REFERENCE_LAYER
 `define REFERENCE_LAYER

module ReferenceCircuitLayer #(
  type type_of_store = AgentPkg::GateConfigStore,
  type input_config_type = StreamSelectionPkg::AgentConfig,
  parameter CONFIG_COUNT_SIZE = AgentPkg::GATE_CONFIG_COUNT_SIZE,
  parameter STAGES_ID_WIDTH = AgentPkg::STAGES_ID_WIDTH,
  parameter NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES,
  parameter NUMBER_OF_INPUT_WIRES = AgentPkg::NUMBER_OF_INPUT_WIRES,
  parameter CHOICE_WIDTH = AgentPkg::CHOICE_WIDTH
) (
  input wire clk,
  input wire resetn,
  input wire start,
  output wire loaded,
  AXI4S.Master out,
  AXI4S.Master passThroughOut,
  AXI4S.Slave in,
  AXI4S.Slave passThroughIn,
  AXI4S.Slave configuration
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
type_of_store configs [NUMBER_OF_STAGES - 1:0];
logic [NUMBER_OF_STAGES - 1:0] packed_valids;

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gate_in[NUMBER_OF_STAGES - 1:0](), gate_out[NUMBER_OF_STAGES - 1:0]();
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) pass_through_in[NUMBER_OF_STAGES - 1:0](), pass_through_out[NUMBER_OF_STAGES - 1:0]();

/////////////////////////////////////////////////////////////////
// configurations
/////////////////////////////////////////////////////////////////
ReferenceStorage #(
  .type_of_store(type_of_store),
  .input_data_type(input_config_type),
  .CONFIG_COUNT_SIZE(CONFIG_COUNT_SIZE),
  .STAGES_ID_WIDTH(STAGES_ID_WIDTH),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES)
) config_extraction (
  .clk(clk),
  .resetn(resetn),
  .validOut(packed_valids),
  .out(configs),
  .in(configuration)
);

assign loaded = &packed_valids;

/////////////////////////////////////////////////////////////////
// input and output connection
/////////////////////////////////////////////////////////////////

Passthrough connect_in_and_gate (
  .clk(clk),
  .resetn(resetn & start),
  .out(gate_in[0]),
  .in(in)
);

Passthrough connect_passthrough_in (
  .clk(clk),
  .resetn(resetn & start),
  .out(pass_through_in[0]),
  .in(passThroughIn)
);

Passthrough connect_passthrough_out (
  .clk(clk),
  .resetn(resetn & start),
  .out(passThroughOut),
  .in(pass_through_out[NUMBER_OF_STAGES - 1])
);

Passthrough connect_gate_and_out (
  .clk(clk),
  .resetn(resetn & start),
  .out(out),
  .in(gate_out[NUMBER_OF_STAGES - 1])
);

/////////////////////////////////////////////////////////////////
// gate data flow
/////////////////////////////////////////////////////////////////
genvar i;
for(i =0 ; i < NUMBER_OF_STAGES; i++)
begin
StreamingGate #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
  .CHOICE_WIDTH(CHOICE_WIDTH)
) gate (
  .clk(clk),
  .resetn(resetn & start),
  .passThrough(AgentPkg::is_passthrough(configs[i])),
  .gateChoice(configs[i].configValue.gateSelect),
  .aSelect(configs[i].configValue.aSelect),
  .bSelect(configs[i].configValue.bSelect),
  .cSelect(configs[i].configValue.cSelect),
  .in(gate_in[i]),
  .passThroughIn(pass_through_in[i]),
  .passThroughOut(pass_through_out[i]),
  .out(gate_out[i])
);
end
endmodule

`endif