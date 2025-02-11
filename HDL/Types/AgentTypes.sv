`ifndef AGENT_TYPES
 `define AGENT_TYPES

package AgentPkg;
localparam NUMBER_OF_STAGES = 6;
localparam STAGES_ID_WIDTH = $clog2(NUMBER_OF_STAGES);
localparam DATA_WIDTH = 8;
localparam NUMBER_OF_INPUT_WIRES = 4;

localparam GATE_CONFIG_SIZE = 4 * 4;
localparam GATE_CONFIG_IN_STREAM = (GATE_CONFIG_SIZE + (DATA_WIDTH - 1)) / DATA_WIDTH;
localparam GATE_CONFIG_COUNT_SIZE = $clog2(GATE_CONFIG_IN_STREAM);

typedef logic [(DATA_WIDTH/2) - 1:0] nibbleType;
typedef logic [DATA_WIDTH - 1:0] byteType;

typedef struct packed {
    nibbleType gateSelect;
    nibbleType cSelect;
    nibbleType bSelect;
    nibbleType aSelect;
} GateConfig;

typedef union packed {
    GateConfig configValue;
    logic [GATE_CONFIG_IN_STREAM -1 :0] [DATA_WIDTH - 1:0] data;
} GateConfigStore;

// Essentially will make a gate passthrough if the choice
// for both wire a and b are the same.
function logic is_passthrough(input GateConfig gateConfig);
  return (gateConfig.aSelect == gateConfig.bSelect);
endfunction

localparam LFSR_SIZE = 16;
localparam SEED_SIZE = 2*LFSR_SIZE;
localparam SEED_CONFIG_IN_BYTES = (SEED_SIZE + (DATA_WIDTH - 1)) / DATA_WIDTH;
localparam LFSR_CONFIG_COUNT_SIZE = $clog2(SEED_CONFIG_IN_BYTES);

type logic [LFSR_SIZE - 1:0] lfsrType;

typedef struct packed {
  lfsrType gateSeed;
  lfsrType wireSelectionSeed;
} SearchConfig;

typedef union packed {
    SearchConfig configValue;
    logic [SEED_CONFIG_IN_BYTES -1 :0] [DATA_WIDTH - 1:0] data;
} SearchConfigStore;

endpackage

`endif