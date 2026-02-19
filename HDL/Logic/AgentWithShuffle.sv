`ifndef AGENT_WITH_SHUFFLE
 `define AGENT_WITH_SHUFFLE


module AgentWithShuffle #(
    parameter NUMBER_OF_GATES = ShufflePkg::NUMBER_OF_COLUMNS,
    parameter NUMBER_OF_STAGES = 8,
    parameter NUMBER_OF_INPUT_WIRES = 11,
    parameter ATTEMPT_COUNT_LIMIT = 1_000_000_000,
    parameter ATTEMPT_COUNT_SIZE = $clog2(ATTEMPT_COUNT_LIMIT),
    parameter SAMPLE_COUNT_WIDTH = NUMBER_OF_INPUT_WIRES - $clog2(NUMBER_OF_STAGES)
) (
  input wire clk,
  input wire resetn,
  input wire validConfig,
  input wire resetFunc,
  input SoftwareInterfacePkg::FullAgentConfig agentConfig,
  output logic equal,
  output logic found,
  output logic done,
  output logic timedOut,
  output logic stored,
  output logic [SAMPLE_COUNT_WIDTH:0] sampleCount,
  output logic [ATTEMPT_COUNT_SIZE - 1:0] attemptCount
);

logic reset_data_flow;
AgentPkg::GateConfig search_gate_configs [NUMBER_OF_GATES - 1:0];
AgentPkg::GateConfig reference_gate_configs [NUMBER_OF_GATES - 1:0];

////////////////////////////////////////////////////////////////////////
// Shuffle and sample
////////////////////////////////////////////////////////////////////////
ShuffleAndSample #(
  .ATTEMPT_COUNT_SIZE(ATTEMPT_COUNT_SIZE),
  .ATTEMPT_COUNT_LIMIT(ATTEMPT_COUNT_LIMIT),
  .SAMPLE_COUNT_SIZE(SAMPLE_COUNT_WIDTH),
  .NUMBER_OF_GATES(NUMBER_OF_GATES)
) shuffle_and_sample (
  .clk(clk),
  .resetn(resetn),
  .equal(equal),
  .validConfig(validConfig),
  .resetFunc(resetFunc),
  .sampleCount(sampleCount),
  .attemptCount(attemptCount),
  .resetDataFlow(reset_data_flow),
  .timedOut(timedOut),
  .found(found),
  .stored(stored),
  .wire_configs(search_gate_configs),
  .incomingConfig(agentConfig)
);

////////////////////////////////////////////////////////////////////////
// Circuit
////////////////////////////////////////////////////////////////////////

genvar i;
for (i=0; i<NUMBER_OF_GATES; i++) begin
  assign reference_gate_configs[i] = agentConfig.gateConfigs[i];
end

CircuitTestBench #(
  .NUMBER_OF_GATES(NUMBER_OF_GATES),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) circuit_test_bench (
  .clk(clk),
  .resetn(resetn & reset_data_flow & resetFunc),
  .validConfigIn(validConfig),
  .searchGateConfigs(search_gate_configs), 
  .referenceGateConfigs(reference_gate_configs), 
  .done(done),
  .equal(equal),
  .count(sampleCount)
);

endmodule : AgentWithShuffle


`endif