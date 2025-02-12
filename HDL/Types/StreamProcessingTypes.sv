`ifndef STREAM_PROCESSING_TYPES
 `define STREAM_PROCESSING_TYPES

`include "AgentTypes.sv"

package StreamSelectionPkg;
localparam NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES;
localparam STAGES_ID_WIDTH = AgentPkg::STAGES_ID_WIDTH;
localparam DATA_WIDTH = AgentPkg::DATA_WIDTH;

typedef enum logic [0:0] { 
    REFERENCE_PARAMETER = 1'b0,
    SEARCH_PARAMETER = 1'b1
 } ConfigType;
 
typedef logic [STAGES_ID_WIDTH - 1:0] stageID;

typedef struct packed {
    ConfigType configType;
    stageID id;
    logic [DATA_WIDTH - 1:0] data;
} AgentConfig;

localparam CONFIG_DATA_WIDTH = $bits(AgentConfig);
localparam NUMBER_OF_AGENTS = 16;
localparam AGENT_ID_WIDTH = $clog2(NUMBER_OF_AGENTS);

typedef logic [AGENT_ID_WIDTH - 1:0] agentID;

typedef struct packed {
    agentID id;
    logic [CONFIG_DATA_WIDTH - 1:0] data;
} StreamData;

localparam STREAM_DATA_WIDTH = $bits(StreamData);

endpackage


`endif