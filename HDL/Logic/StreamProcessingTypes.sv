`ifndef STREAM_PROCESSING_TYPES
 `define STREAM_PROCESSING_TYPES

package StreamSelectionPkg;
localparam NUMBER_OF_STAGES = 6;
localparam STAGES_ID_WIDTH = $clog2(NUMBER_OF_STAGES);
localparam DATA_WIDTH = 8;

typedef enum logic [0:0] { 
    REFERENCE_PARAMETER = 1'b0,
    SEARCH_PARAMETER = 1'b1
 } ConfigType;

typedef struct packed {
    ConfigType configType;
    logic [STAGES_ID_WIDTH - 1:0] id;
    logic [DATA_WIDTH - 1:0] data;
} AgentConfig;

localparam CONFIG_DATA_WIDTH = $bits(AgentConfig);
localparam NUMBER_OF_AGENTS = 16;
localparam CONFIG_ID_WIDTH = $clog2(NUMBER_OF_AGENTS);

typedef struct packed {
    logic [CONFIG_ID_WIDTH - 1:0] id;
    logic [CONFIG_DATA_WIDTH - 1:0] data;
} StreamData;

endpackage


`endif