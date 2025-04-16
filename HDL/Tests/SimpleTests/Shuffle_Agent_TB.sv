`ifndef AGENT_WITH_SHUFFLE_TB
  `define AGENT_WITH_SHUFFLE_TB


module Shuffle_Agent_TB ();
localparam NUMBER_OF_GATES = ShufflePkg::NUMBER_OF_COLUMNS;
localparam NUMBER_OF_STAGES = 8;
localparam NUMBER_OF_INPUT_WIRES = 11;
localparam ATTEMPT_COUNT_LIMIT = 1_000_000_000;
localparam ATTEMPT_COUNT_SIZE = $clog2(ATTEMPT_COUNT_LIMIT);
localparam SAMPLE_COUNT_WIDTH = NUMBER_OF_INPUT_WIRES - $clog2(NUMBER_OF_STAGES);
// Signal declarations
logic clk;
logic resetn;
logic validConfig;
logic resetFunc;
SoftwareInterfacePkg::FullAgentConfig agentConfig;
logic equal;
logic done;
logic found;
logic timedOut;
logic stored;
logic [SAMPLE_COUNT_WIDTH:0] sampleCount;
logic [ATTEMPT_COUNT_SIZE - 1:0] attemptCount;
SoftwareInterfacePkg::FullAgentConfigStore store_write;
AgentPkg::GateConfig agent_configs [0:NUMBER_OF_GATES - 1];
ShufflePkg::Targets targets;
ShufflePkg::Controls controls;
ShufflePkg::ActiveWire active_wire;

// Instantiate the AgentWithShuffle module
AgentWithShuffle #(
    .NUMBER_OF_GATES(NUMBER_OF_GATES),
    .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
    .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
    .ATTEMPT_COUNT_LIMIT(ATTEMPT_COUNT_LIMIT),
    .ATTEMPT_COUNT_SIZE(ATTEMPT_COUNT_SIZE),
    .SAMPLE_COUNT_WIDTH(SAMPLE_COUNT_WIDTH)
) agent_with_shuffle (
    .clk(clk),
    .resetn(resetn),
    .validConfig(validConfig),
    .resetFunc(resetFunc),
    .agentConfig(agentConfig),
    .equal(equal),
    .done(done),
    .found(found),
    .timedOut(timedOut),
    .stored(stored),
    .sampleCount(sampleCount),
    .attemptCount(attemptCount)
);

always #5 clk = ~clk;



initial
begin
  $dumpfile("Shuffle_Agent.vcd"); 
  $dumpvars (0, Shuffle_Agent_TB);
clk = 0;
resetn = 0;
validConfig = 0;
resetFunc = 0;
agent_configs[0].gateSelect = 4'd2;
agent_configs[0].cSelect = 4'd1;
agent_configs[0].bSelect = 4'd2;
agent_configs[0].aSelect = 4'd8;

agent_configs[1].gateSelect = 4'd3;
agent_configs[1].cSelect = 4'd3;
agent_configs[1].bSelect = 4'd4;
agent_configs[1].aSelect = 4'd9;

agent_configs[2].gateSelect = 4'd9;
agent_configs[2].cSelect = 4'd5;
agent_configs[2].bSelect = 4'd6;
agent_configs[2].aSelect = 4'd10;

agent_configs[3].gateSelect = 4'd6;
agent_configs[3].cSelect = 4'd7;
agent_configs[3].bSelect = 4'd8;
agent_configs[3].aSelect = 4'd0;

agent_configs[4].gateSelect = 4'd5;
agent_configs[4].cSelect = 4'd3;
agent_configs[4].bSelect = 4'd7;
agent_configs[4].aSelect = 4'd2;

agentConfig.gateConfigs[0] = agent_configs[0];
agentConfig.gateConfigs[1] = agent_configs[1];
agentConfig.gateConfigs[2] = agent_configs[2];
agentConfig.gateConfigs[3] = agent_configs[3];
agentConfig.gateConfigs[4] = agent_configs[4];


targets.row[0] = {0};
controls.row[0][0] = {0};
controls.row[0][1] = {0};
targets.row[1] = '{position: 4'd3, present: 1'b1};
controls.row[1][0] = {0};
controls.row[1][1] = {0};
targets.row[2] = {0};
controls.row[0][2] = {0};
controls.row[1][2] = {0};
targets.row[3] = {0};
controls.row[0][3] = {0};
controls.row[1][3] = {0};
targets.row[4] = {0};
controls.row[0][4] = '{position: 4'd7, present: 1'b1};
controls.row[1][4] = '{position: 4'd3, present: 1'b1};

for (int i=0; i<5; i++) begin
  $display("The active wire of the target[%0d] is %0d", i, targets.row[i].position);
  $display("The active wire of the control[0][%0d] is %0d", i, controls.row[0][i].position);
  $display("The active wire of the control[1][%0d] is %0d", i, controls.row[1][i].position);
  agentConfig.shuffleWires[0][i] = targets.row[i];
  agentConfig.shuffleWires[1][i] = controls.row[0][i];
  agentConfig.shuffleWires[2][i] = controls.row[1][i];
  agentConfig.sampleLfsrSeeds[i] = {10'd123, 10'd123};
end
agentConfig.shuffleLfsrSeeds = {32'd74328, 32'd66844};

#5;
resetn = 1;
#20;
resetFunc = 1;
validConfig = 1;
#1000;
$finish;
end

endmodule

`endif