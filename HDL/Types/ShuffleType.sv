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