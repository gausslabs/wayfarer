`ifndef AGENT_TYPES
 `define AGENT_TYPES

package AgentPkg;
localparam NUMBER_OF_STAGES = 6;
localparam STAGES_ID_WIDTH = $clog2(NUMBER_OF_STAGES);
localparam DATA_WIDTH = 8;

localparam GATE_CONFIG_SIZE = 2;

typedef logic [DATA_WIDTH - 1:0] byteType;

typedef struct packed {
    byteType gateSelect;
    byteType cSelect;
    byteType bSelect;
    byteType aSelect;
} GateConfig;

typedef union packed {
    GateConfig gateConfig;
    logic [GATE_CONFIG_SIZE -1 :0] [DATA_WIDTH - 1:0] data;
} GateConfigStore;

// Essentially will make a gate passthrough if the choice
// for both wire a and b are the same.
function logic is_passthrough(input GateConfig gateConfig);
  return (gateConfig.aSelect == gateConfig.bSelect);
endfunction

endpackage

`endif