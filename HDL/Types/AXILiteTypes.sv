`ifndef AXI_lITE_TYPES
 `define AXI_lITE_TYPES

package AXILitePkg;

localparam AGENT_CONFIG_WIDTH = $bits(AgentPkg::GateConfig);

localparam NUMBER_OF_GATES = 2;

localparam NUMBER_OF_WORDS = ((NUMBER_OF_GATES * AGENT_CONFIG_WIDTH) + 31 )/ 32;

typedef union packed {
    logic [0:NUMBER_OF_GATES - 1] [AGENT_CONFIG_WIDTH - 1:0] configValue;
    logic [0:NUMBER_OF_WORDS - 1][31:0] data;
} GateConfigStore;


endpackage

`endif