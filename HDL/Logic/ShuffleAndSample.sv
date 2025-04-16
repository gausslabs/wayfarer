`ifndef SHUFFLE_AND_SAMPLE
 `define SHUFFLE_AND_SAMPLE

module ShuffleAndSample #(
    parameter ATTEMPT_COUNT_SIZE = $clog2(1_000_000_000),
    parameter ATTEMPT_COUNT_LIMIT = 1_000_000_000,
    parameter SAMPLE_COUNT_SIZE = 8,
    parameter NUMBER_OF_GATES = 5,
    parameter SAMPLE_COUNT_LIMIT = 1 << SAMPLE_COUNT_SIZE,
    parameter RUN_TIME_COUNT_SIZE = 8
)(
  input wire clk,
  input wire resetn,
  input wire equal,
  input wire validConfig,
  input wire resetFunc,
  input wire [SAMPLE_COUNT_SIZE :0] sampleCount,
  output logic [ATTEMPT_COUNT_SIZE - 1:0] attemptCount,
  output wire resetDataFlow,
  output wire timedOut,
  output logic found,
  output logic stored,
  output AgentPkg::GateConfig wire_configs [0:NUMBER_OF_GATES - 1],
  input SoftwareInterfacePkg::FullAgentConfig incomingConfig
);
///////////////////////////////////////////////////////////////////////////
// Internal nets
///////////////////////////////////////////////////////////////////////////
logic load_config, sample, sampling_complete, valid_sample, valid_shuffle, enable_sample, enable_shuffle;

///////////////////////////////////////////////////////////////////////////
// Shuffle controller
///////////////////////////////////////////////////////////////////////////
AgentController #(
    .ATTEMPT_COUNT_SIZE(ATTEMPT_COUNT_SIZE),
    .ATTEMPT_COUNT_LIMIT(ATTEMPT_COUNT_LIMIT),
    .SAMPLE_COUNT_SIZE(SAMPLE_COUNT_SIZE),
    .SAMPLE_COUNT_LIMIT(SAMPLE_COUNT_LIMIT)
) shuffle_controller (
    .clk(clk),
    .resetn(resetn & resetFunc),
    .equal(equal),
    .validConfig(validConfig),
    .samplingComplete(sampling_complete), 
    .sampleCount(sampleCount), 
    .attemptCount(attemptCount),
    .found(found),
    .loadConfig(load_config),
    .sample(sample),
    .timedOut(timedOut),
    .resetDataFlow(resetDataFlow)
);

///////////////////////////////////////////////////////////////////////////
// Shuffle Coordinator
///////////////////////////////////////////////////////////////////////////
ShufflePkg::WireData sample_input, shuffled_wires;
AXI4S #(.DATA_WIDTH($bits(ShufflePkg::WireData))) wires();
assign wires.data = incomingConfig.shuffleWires;

ShuffleCoordinator shuffle_coordinator (
    .clk(clk),
    .resetn(resetn & (~load_config) & resetFunc),
    .sample(sample),
    .validShuffle(valid_shuffle),
    .validSample(valid_sample),
    .enableShuffle(enable_shuffle),
    .enableSample(enable_sample)
);


HandShake handshake (
  .clk(clk),
  .resetn(resetn & (~load_config) & resetFunc),
  .valid(validConfig),
  .readyIn(wires.ready),
  .readyOut(stored),
  .syncing(wires.valid)
);

///////////////////////////////////////////////////////////////////////////
// Shuffle
///////////////////////////////////////////////////////////////////////////
Shuffle #(
  .data_type(ShufflePkg::WireData),
  .seed_type(logic [31:0])
) shuffle_wire_matrix (
  .clk(clk),
  .resetn(resetn & (~load_config) & resetFunc),
  .wires_out(shuffled_wires),
  .wires_valid(valid_shuffle),
  .seeds({incomingConfig.shuffleLfsrSeeds[0],
          incomingConfig.shuffleLfsrSeeds[1]}),
  .shuffle_wires(enable_shuffle),
  .wires(wires)
);

///////////////////////////////////////////////////////////////////////////
// Sample
///////////////////////////////////////////////////////////////////////////
logic delayed_load_config=0;
always_ff @ (posedge clk)
  delayed_load_config <= load_config;
// Having the incoming data be held on for one more clock cycle
assign sample_input = (delayed_load_config) ? incomingConfig.shuffleWires : shuffled_wires;
SearchCircuitConfig #(
  .NUMBER_OF_GATES(ShufflePkg::NUMBER_OF_COLUMNS),
  .LFSR_SIZE(ShufflePkg::PERMUTATION_LFSR_SIZE)
) circuit_config_sampler (
  .clk(clk),
  .resetn(resetn & (~load_config) & resetFunc),
  .validConfig(valid_shuffle),
  .sample(enable_sample),
  .validConfigOut(valid_sample),
  .wireDataIn(sample_input),
  .sampleSeeds(incomingConfig.sampleLfsrSeeds),
  .wires(wire_configs)
);

endmodule

`endif