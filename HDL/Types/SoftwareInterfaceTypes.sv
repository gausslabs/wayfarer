`ifndef SW_INTERFACE_TYPES
 `define SW_INTERFACE_TYPES

`include "AgentTypes.sv"

package SoftwareInterfacePkg;

import ShufflePkg::*;
import AgentPkg::GateConfig;

localparam SHUFFLE_LFSR_SIZE = LSFR_SIZE;
localparam NUMBER_0F_LSFRS = 2;
typedef logic [0:NUMBER_0F_LSFRS -1] [SHUFFLE_LFSR_SIZE - 1:0] ShuffleLfsrType;

localparam NUMBER_0F_SAMPLE_LFSRS = 2;
typedef logic [0:NUMBER_OF_COLUMNS - 1] [0:NUMBER_0F_SAMPLE_LFSRS -1] [PERMUTATION_LFSR_SIZE - 1:0] SampleLfsrType;
typedef logic [0:NUMBER_OF_COLUMNS - 1] [$bits(GateConfig) - 1:0] GateConfigType;

typedef struct packed {
    WireData shuffleWires;
    ShuffleLfsrType shuffleLfsrSeeds;
    SampleLfsrType sampleLfsrSeeds;
    GateConfigType gateConfigs;
} FullAgentConfig;

localparam FULl_CONFIG_SIZE = $bits(FullAgentConfig);
localparam DATA_WIDTH = 32;
localparam FULl_CONFIG_SIZE_IN_WORDS = (FULl_CONFIG_SIZE + (DATA_WIDTH - 1)) / DATA_WIDTH;

typedef struct packed {
    logic [(FULl_CONFIG_SIZE_IN_WORDS*DATA_WIDTH) - FULl_CONFIG_SIZE - 1:0] pad;
    FullAgentConfig configValue;
} FullAgentConfigStream;

typedef union packed {
    FullAgentConfigStream configValue;
    logic [FULl_CONFIG_SIZE_IN_WORDS - 1:0] [DATA_WIDTH - 1:0] data;
} FullAgentConfigStore;


endpackage


`endif