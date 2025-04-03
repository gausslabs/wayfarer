`ifndef SHUFFLE_TYPES
 `define SHUFFLE_TYPES

`include "AgentTypes.sv"

package ShufflePkg;
parameter WIRE_SIZE = PermutationPkg::WIRE_SIZE;

typedef struct packed {
    logic present;
    logic [WIRE_SIZE - 1:0] position;
} ActiveWire;

parameter NUMBER_OF_COLUMNS = AgentPkg::NUMBER_OF_STAGES;
localparam LSFR_SIZE = 32;
localparam PERMUTATION_LFSR_SIZE = 10;

typedef logic [0:NUMBER_OF_COLUMNS - 1] [$bits(ActiveWire) - 1:0] TargetStream;
typedef logic [0:(2*NUMBER_OF_COLUMNS) - 1] [$bits(ActiveWire) - 1:0] ControlStream;
typedef logic [0:1] [0:NUMBER_OF_COLUMNS - 1] [$bits(ActiveWire) - 1:0] ControlData;
typedef logic [0:(3*NUMBER_OF_COLUMNS) - 1] [$bits(ActiveWire) - 1:0] WireStream;
typedef logic [0:2] [0:NUMBER_OF_COLUMNS - 1] [$bits(ActiveWire) - 1:0] WireData;
typedef logic [LSFR_SIZE - 1:0] LfsrType;
typedef logic [PERMUTATION_LFSR_SIZE - 1:0] SeedType;
typedef logic [0:NUMBER_OF_COLUMNS - 1][0:1][PERMUTATION_LFSR_SIZE - 1:0] CircuitSeedType;

localparam WIRE_MATRIX_SIZE_IN_BYTES = ($bits(WireStream) + $bits(LfsrType) + $bits(CircuitSeedType) + (AgentPkg::DATA_WIDTH - 1)) / AgentPkg::DATA_WIDTH;
localparam PAD_WIDTH = (8 * WIRE_MATRIX_SIZE_IN_BYTES) - ($bits(WireStream) + $bits(LfsrType) + $bits(CircuitSeedType));

typedef union packed {
    struct packed{
        logic [PAD_WIDTH - 1:0] pad;
        WireStream stream;
        LfsrType seed;
        CircuitSeedType seeds;
    } configValue;
    logic [0:WIRE_MATRIX_SIZE_IN_BYTES - 1] [AgentPkg::DATA_WIDTH - 1:0] data;
} WireMatrixStore;

typedef union packed {
    ControlStream stream;
    logic [0:1] [0:NUMBER_OF_COLUMNS - 1] [$bits(ActiveWire) - 1:0] data;
} ControlMatrix;

typedef union packed {
    WireStream stream;
    logic [0:2] [0:NUMBER_OF_COLUMNS - 1] [$bits(ActiveWire) - 1:0] data;
} WireMatrix;

typedef struct {
    ActiveWire row [0:NUMBER_OF_COLUMNS - 1];
} Targets;

typedef struct {
    ActiveWire row [0:1] [0:NUMBER_OF_COLUMNS - 1];
} Controls;

function logic collision(ActiveWire value, other_1, other_2);
    collision = (value.present & other_1.present & (value.position == other_1.position)) | (value.present & other_2.present & (value.position == other_2.position));
endfunction


endpackage : ShufflePkg

`endif