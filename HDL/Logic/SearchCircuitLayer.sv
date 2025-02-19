`ifndef SEARCH_CIRCUIT_LAYER
 `define SEARCH_CIRCUIT_LAYER

`default_nettype none

module SearchCircuitLayer #(
  type type_of_store = AgentPkg::SearchConfigStore,
  type input_config_type = StreamSelectionPkg::AgentConfig,
  parameter CONFIG_COUNT_SIZE = AgentPkg::SEED_CONFIG_IN_BYTES,
  parameter STAGES_ID_WIDTH = AgentPkg::STAGES_ID_WIDTH,
  parameter NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES,
  parameter LFSRPkg::LFSRType LFSR_TYPE  = AgentPkg::LFSR_TYPE,
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = AgentPkg::PERMUTATION_TYPE,
  parameter NUMBER_OF_INPUT_WIRES = AgentPkg::NUMBER_OF_INPUT_WIRES,
  parameter CHOICE_WIDTH = AgentPkg::CHOICE_WIDTH
) (
  input wire clk,
  input wire resetn,
  input wire load,
  input wire next,
  output logic loaded,
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
logic [NUMBER_OF_STAGES - 1:0] data_flow_enable;
logic flow_enable;

assign flow_enable = &data_flow_enable;

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gate_internal[NUMBER_OF_STAGES:0]();
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) passThrough[NUMBER_OF_STAGES:0]();

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
  .resetn(resetn & load & flow_enable),
  .out(gate_internal[0]),
  .in(in)
);

Passthrough connect_passthrough_in (
  .clk(clk),
  .resetn(resetn & load & flow_enable),
  .out(passThrough[0]),
  .in(passThroughIn)
);

Passthrough connect_passthrough_out (
  .clk(clk),
  .resetn(resetn & load & flow_enable),
  .out(passThroughOut),
  .in(passThrough[NUMBER_OF_STAGES])
);

Passthrough connect_gate_and_out (
  .clk(clk),
  .resetn(resetn & load & flow_enable),
  .out(out),
  .in(gate_internal[NUMBER_OF_STAGES])
);

/////////////////////////////////////////////////////////////////
// gate data flow
/////////////////////////////////////////////////////////////////
genvar i;
for(i =0 ; i < NUMBER_OF_STAGES; i++)
begin

SearchGate #(
  .LFSR_TYPE(LFSR_TYPE),
  .PERMUTATION_TYPE(PERMUTATION_TYPE)
) gate (
  .clk(clk),
  .resetn(resetn),
  .load(load),
  .next(next),
  .dataFlowEnable(data_flow_enable[i]),
  .gateSeed(configs[i].configValue.gateSeed),
  .wireSeed(configs[i].configValue.wireSelectionSeed),
  .in(gate_internal[i]),
  .passThroughIn(passThrough[i]),
  .passThroughOut(passThrough[i + 1]),
  .out(gate_internal[i + 1])
);
end
endmodule

`endif