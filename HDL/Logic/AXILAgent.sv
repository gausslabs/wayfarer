`ifndef AGENT_AXIL
 `define AGENT_AXIL

module AXILAgent (
  input wire clk,
  input wire resetn,
 // Axi ports

  input  logic  [31:0]  axil_awaddr,
  input  logic  [54:0]  axil_awuser,
  input  logic          axil_awvalid,
  output logic          axil_awready,

  input  logic  [31:0]  axil_wdata,
  input  logic   [3:0]  axil_wstrb,
  input  logic          axil_wvalid,
  output logic          axil_wready,

  output logic   [1:0]  axil_bresp,
  output logic          axil_bvalid,
  input  logic          axil_bready,

  input  logic  [31:0]  axil_araddr,
  input  logic  [54:0]  axil_aruser,
  input  logic          axil_arvalid,
  output logic          axil_arready,

  output logic  [31:0]  axil_rdata,
  output logic   [1:0]  axil_rresp,
  output logic          axil_rvalid,
  input  logic          axil_rready
 
);

////////////////////////////////////////////////////////////////////////
// Internal nets
////////////////////////////////////////////////////////////////////////
localparam NUMBER_WRITE_WORDS = SoftwareInterfacePkg::FULl_CONFIG_SIZE_IN_WORDS + 1;
localparam METRICS_COUNT = 4;
localparam NUMBER_READ_WORDS = SoftwareInterfacePkg::FULl_CONFIG_SIZE_IN_WORDS + METRICS_COUNT;
localparam NUMBER_OF_GATES = ShufflePkg::NUMBER_OF_COLUMNS;
localparam NUMBER_OF_STAGES = 8;
localparam NUMBER_OF_INPUT_WIRES = 11;
localparam ATTEMPT_COUNT_LIMIT = 1_000_000_000;
localparam ATTEMPT_COUNT_SIZE = $clog2(ATTEMPT_COUNT_LIMIT);
SoftwareInterfacePkg::FullAgentConfig agentConfig;
logic [NUMBER_WRITE_WORDS- 1:0] [31:0] incomingData;
logic [NUMBER_READ_WORDS - 1:0] [31:0] outgoingData;
logic [63:0] run_time;
logic valid_config, reset_func;
localparam MEAN_DATA_WIDTH = 16;
localparam ALPHA_SHIFT = 10;
localparam SAMPLE_COUNT_WIDTH = 11 - $clog2(NUMBER_OF_STAGES);
logic [MEAN_DATA_WIDTH - 1:0] mean;
logic equal, reset_data_flow, done, found, timed_out, stored;
AgentPkg::GateConfig searchGateConfigs [NUMBER_OF_GATES - 1:0];
AgentPkg::GateConfig referenceGateConfigs [NUMBER_OF_GATES - 1:0];
logic [SAMPLE_COUNT_WIDTH:0] sample_count;
logic [ATTEMPT_COUNT_SIZE - 1:0] attempt_count;

////////////////////////////////////////////////////////////////////////
// MemMap
////////////////////////////////////////////////////////////////////////
AXILStore #(
    .NUMBER_WRITE_WORDS(NUMBER_WRITE_WORDS),
    .NUMBER_READ_WORDS(NUMBER_READ_WORDS),
    .START_OFFSET(32'd0)
) axil_store (
// Base
  .clk(clk),
  .resetn(resetn),

// Config Ports
  .inputs(incomingData),
  .outputs(outgoingData),

// Axi ports
  .axil_awaddr(axil_awaddr),
  .axil_awuser(axil_awuser),
  .axil_awvalid(axil_awvalid),
  .axil_awready(axil_awready),

  .axil_wdata(axil_wdata),
  .axil_wstrb(axil_wstrb),
  .axil_wvalid(axil_wvalid),
  .axil_wready(axil_wready),

  .axil_bresp(axil_bresp),
  .axil_bvalid(axil_bvalid),
  .axil_bready(axil_bready),

  .axil_araddr(axil_araddr),
  .axil_aruser(axil_aruser),
  .axil_arvalid(axil_arvalid),
  .axil_arready(axil_arready),

  .axil_rdata(axil_rdata),
  .axil_rresp(axil_rresp),
  .axil_rvalid(axil_rvalid),
  .axil_rready(axil_rready)
);

ControlAndStatusMemMap #(
    .NUMBER_WRITE_WORDS(NUMBER_WRITE_WORDS),
    .METRICS_COUNT(METRICS_COUNT),
    .NUMBER_READ_WORDS(NUMBER_READ_WORDS)
) control_and_status_mem_map (
    .clk(clk),
    .resetn(resetn),
    .done(done),
    .found(found),
    .timedOut(timed_out),
    .equal(equal),
    .stored(stored),
    .incomingData(incomingData),
    .outgoingData(outgoingData),
    .incomingConfig(agentConfig),
    .validConfig(valid_config),
    .resetFunc(reset_func),
    .incomingMean({{(32 - MEAN_DATA_WIDTH){1'b0}},mean}), 
    .incomingRunTime(run_time), 
    .incomingFailureCount({{(32 - ATTEMPT_COUNT_SIZE){1'b0}},attempt_count})
);


////////////////////////////////////////////////////////////////////////
// MemMap converter
////////////////////////////////////////////////////////////////////////
Metrics #(
    .MEAN_DATA_WIDTH(MEAN_DATA_WIDTH),
    .ALPHA_SHIFT(ALPHA_SHIFT),
    .SAMPLE_COUNT_WIDTH(SAMPLE_COUNT_WIDTH+1)
) metrics (
    .clk(clk),
    .resetn(resetn),
    .fail(~equal),
    .sampleCount(sample_count),
    .mean(mean), 
    .runTime(run_time) 
);

////////////////////////////////////////////////////////////////////////
// Shuffle and sample
////////////////////////////////////////////////////////////////////////
ShuffleAndSample #(
  .ATTEMPT_COUNT_SIZE(ATTEMPT_COUNT_SIZE),
  .ATTEMPT_COUNT_LIMIT(ATTEMPT_COUNT_LIMIT),
  .SAMPLE_COUNT_SIZE(NUMBER_OF_INPUT_WIRES - $clog2(NUMBER_OF_STAGES)),
  .NUMBER_OF_GATES(NUMBER_OF_GATES)
) shuffle_and_sample (
  .clk(clk),
  .resetn(resetn),
  .equal(equal),
  .validConfig(valid_config),
  .resetFunc(reset_func),
  .sampleCount(sample_count),
  .attemptCount(attempt_count),
  .resetDataFlow(reset_data_flow),
  .timedOut(timed_out),
  .found(found),
  .stored(stored),
  .wire_configs(searchGateConfigs),
  .incomingConfig(agentConfig)
);

////////////////////////////////////////////////////////////////////////
// Circuit
////////////////////////////////////////////////////////////////////////

genvar i;
for (i=0; i<NUMBER_OF_GATES; i++) begin
  assign referenceGateConfigs[i] = agentConfig.gateConfigs[i];
end

CircuitTestBench #(
  .NUMBER_OF_GATES(NUMBER_OF_GATES),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) circuit_test_bench (
  .clk(clk),
  .resetn(resetn & reset_data_flow & reset_func),
  .validConfigIn(valid_config),
  .searchGateConfigs(searchGateConfigs), 
  .referenceGateConfigs(referenceGateConfigs), 
  .done(done),
  .equal(equal),
  .count(sample_count)
);

endmodule

module ControlAndStatusMemMap #(
    parameter NUMBER_WRITE_WORDS = SoftwareInterfacePkg::FULl_CONFIG_SIZE_IN_WORDS + 1,
    parameter METRICS_COUNT = 4,
    parameter STATUS_COUNT = 1,
    parameter NUMBER_READ_WORDS = SoftwareInterfacePkg::FULl_CONFIG_SIZE_IN_WORDS + METRICS_COUNT + STATUS_COUNT
)(
  input wire clk,
  input wire resetn,
  input wire done,
  input wire found,
  input wire timedOut,
  input wire equal,
  input wire stored,
  input wire [NUMBER_WRITE_WORDS- 1:0] [31:0] incomingData,
  output logic [NUMBER_READ_WORDS - 1:0] [31:0] outgoingData,
  output SoftwareInterfacePkg::FullAgentConfig incomingConfig,
  output logic validConfig,
  output logic resetFunc,
  input wire [31:0] incomingMean,
  input wire [63:0] incomingRunTime,
  input wire [31:0] incomingFailureCount
);

////////////////////////////////////////////////////////////////////////
// Internal nets
////////////////////////////////////////////////////////////////////////
SoftwareInterfacePkg::FullAgentConfigStore configStore;

////////////////////////////////////////////////////////////////////////
// Assigning the agent config back to be read by software
////////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  outgoingData[NUMBER_READ_WORDS - 1:METRICS_COUNT] <= incomingData[NUMBER_WRITE_WORDS - 1:1];
end
else
begin
  outgoingData[NUMBER_READ_WORDS - 1:METRICS_COUNT] <= 0;
end
end

////////////////////////////////////////////////////////////////////////
// Assigning the metrics to be read by software
////////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  outgoingData[METRICS_COUNT - 1:STATUS_COUNT] <= {incomingMean, incomingRunTime, incomingFailureCount};
end
else
begin
  outgoingData[METRICS_COUNT - 1:STATUS_COUNT] <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  outgoingData[STATUS_COUNT - 1:0] <= {{(32 - 5){1'b0}},done, found, timedOut, equal, stored};
end
else
begin
  outgoingData[STATUS_COUNT - 1:0] <= 0;
end
end

////////////////////////////////////////////////////////////////////////
// Configs for the agent
////////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  validConfig <= incomingData[0][0];
  resetFunc <= incomingData[0][1];
  configStore.data <= incomingData[NUMBER_WRITE_WORDS - 1:1];
end
else
begin
  validConfig <= 1'b0;
  resetFunc <= 1'b0;
  configStore.data <= 0;
end
end

assign incomingConfig = configStore.configValue.configValue;

endmodule


module Metrics #(
    parameter MEAN_DATA_WIDTH = 16,
    parameter ALPHA_SHIFT = 10,
    parameter SAMPLE_COUNT_WIDTH = 8
)(
  input wire clk,
  input wire resetn,
  input wire fail,
  input wire [SAMPLE_COUNT_WIDTH - 1:0] sampleCount,
  output logic [MEAN_DATA_WIDTH - 1:0] mean,
  output logic [63:0] runTime
);

////////////////////////////////////////////////////////////////////////
// Mean
////////////////////////////////////////////////////////////////////////
AlphaFilter #(
    .DATA_WIDTH(MEAN_DATA_WIDTH),
    .ALPHA_SHIFT(ALPHA_SHIFT)
) mean_calculator (
.clk(clk),
.resetn(resetn),
.validIn(fail), 
.dataIn({{(MEAN_DATA_WIDTH - SAMPLE_COUNT_WIDTH){1'b0}},sampleCount}),
.meanOut(mean)
);

////////////////////////////////////////////////////////////////////////
// Runtime
////////////////////////////////////////////////////////////////////////

Counter #(
  .COUNTER_WIDTH(64)
) run_time(
.clk(clk),
.resetn(resetn),
.enable(1'b1),
.count(runTime)
);


endmodule

module AlphaFilter #(
    parameter DATA_WIDTH = 16,
    parameter ALPHA_SHIFT = 10
) (
  input wire clk,
  input wire resetn,
  input wire validIn,
  input wire [DATA_WIDTH - 1:0] dataIn,
  output logic [DATA_WIDTH - 1:0] meanOut
);
////////////////////////////////////////////////////////////////////////
// Internal nets
////////////////////////////////////////////////////////////////////////
logic [DATA_WIDTH + ALPHA_SHIFT - 1:0] mean;

assign meanOut = mean[DATA_WIDTH + ALPHA_SHIFT - 1:ALPHA_SHIFT];

////////////////////////////////////////////////////////////////////////
// Calculation
////////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(validIn)
    mean <= mean + ((dataIn - mean) >> ALPHA_SHIFT);
end
else
begin
  mean <= 0;
end
end


endmodule

`endif