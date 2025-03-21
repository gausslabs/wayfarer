`ifndef AGENT_TYPES
 `define AGENT_TYPES

package PermutationPkg;

typedef logic [3:0] NibbleType;
typedef logic [0:4] [3:0] FiveWireType;

typedef enum logic [1:0] { 
  WIRES_05,
  WIRES_11,
  WIRES_13
 } SafePermutaions;

 function SafePermutaions wire_type (input int s);
  case (s)
    2:
       wire_type = WIRES_05;
    5:
       wire_type = WIRES_11;
    6:
       wire_type = WIRES_13;
   default:
       wire_type = WIRES_05;
  endcase
 endfunction

 function int number_of_wires (input SafePermutaions s);
  case (s)
    WIRES_05:
       number_of_wires = 5;
    WIRES_11:
       number_of_wires = 11;
    WIRES_13:
       number_of_wires = 13;
  endcase
 endfunction

 function int permutaion_bit_width (input SafePermutaions s);
  case (s)
    WIRES_05:
       permutaion_bit_width = $clog2(5*4*3);
    WIRES_11:
       permutaion_bit_width = $clog2(11*10*9);
    WIRES_13:
       permutaion_bit_width = $clog2(13*12*11);
  endcase
 endfunction

 function int total_number_of_permutaion (input SafePermutaions s);
  case (s)
    WIRES_05:
       total_number_of_permutaion = 5*4*3;
    WIRES_11:
       total_number_of_permutaion = 11*10*9;
    WIRES_13:
       total_number_of_permutaion = 13*12*11;
  endcase
 endfunction

 function int port_bit_width (input SafePermutaions s);
   case (s)
     WIRES_05:
        port_bit_width = $clog2(5);
     WIRES_11:
        port_bit_width = $clog2(11);
     WIRES_13:
        port_bit_width = $clog2(13);
   endcase
 endfunction

endpackage

package LFSRPkg;

typedef enum logic [1:0] { 
  LFSR_08,
  LFSR_16
} LFSRType;

  function int port_bit_width (input LFSRType l);
  case (l)
    LFSR_08:
       port_bit_width = 8;
    LFSR_16:
       port_bit_width = 16;
  endcase
 endfunction

endpackage

package AgentPkg;
localparam LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_16;
localparam NUMBER_OF_STAGES = 6;
localparam PermutationPkg::SafePermutaions PERMUTATION_TYPE = PermutationPkg::wire_type(NUMBER_OF_STAGES);
localparam STAGES_ID_WIDTH = $clog2(NUMBER_OF_STAGES);
localparam DATA_WIDTH = 8;
localparam NUMBER_OF_INPUT_WIRES = PermutationPkg::number_of_wires(PERMUTATION_TYPE);
localparam CHOICE_WIDTH = $clog2(NUMBER_OF_INPUT_WIRES);

localparam GATE_CONFIG_SIZE = 4 * 4;
localparam GATE_CONFIG_IN_STREAM = (GATE_CONFIG_SIZE + (DATA_WIDTH - 1)) / DATA_WIDTH;
localparam GATE_CONFIG_COUNT_SIZE = $clog2(GATE_CONFIG_IN_STREAM);

typedef logic [(DATA_WIDTH/2) - 1:0] nibbleType;
typedef logic [DATA_WIDTH - 1:0] NibbleType;

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

localparam LFSR_SIZE = LFSRPkg::port_bit_width(LFSR_TYPE);
localparam SEED_SIZE = 2*LFSR_SIZE;
localparam SEED_CONFIG_IN_BYTES = (SEED_SIZE + (DATA_WIDTH - 1)) / DATA_WIDTH;
localparam LFSR_CONFIG_COUNT_SIZE = $clog2(SEED_CONFIG_IN_BYTES);

typedef logic [LFSR_SIZE - 1:0] lfsrType;

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