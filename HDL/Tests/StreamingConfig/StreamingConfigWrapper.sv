`ifndef STREAMING_CONFIG_WRAPPER
 `define STREAMING_CONFIG_WRAPPER

module StreamingConfigWrapper (
  input wire clk,
  input wire resetn,
  AXI4S.Master reference,
  AXI4S.Master search,
  AXI4S.Slave in 
);


/////////////////////////////////////////////////////////////////
// only allowing 2
/////////////////////////////////////////////////////////////////
AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::StreamData))) prune();
AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig))) agent(), reference_in(), search_in();
localparam StreamSelectionPkg::agentID PRUNE_ID = StreamSelectionPkg::agentID'(2);

StreamDataExtractionBasedOnID #(
    .data_type(StreamSelectionPkg::StreamData),
    .id_type(StreamSelectionPkg::agentID),
    .SELECTION_VALUE(PRUNE_ID)
) prune_id_2 (
  .clk(clk),
  .resetn(resetn),
  .out(prune),
  .in(in) 
);

/////////////////////////////////////////////////////////////////
// ExtractAgentConfig
/////////////////////////////////////////////////////////////////
ExtractAgentConfig #(
  .in_data_type(StreamSelectionPkg::StreamData),
  .out_data_type(StreamSelectionPkg::AgentConfig)
) extract_agent_config (
  .clk(clk),
  .resetn(resetn),
  .out(agent),
  .in(prune) 
);

Tee tee (
  .streamOne(search_in),
  .streamTwo(reference_in),
  .in(agent)
);

/////////////////////////////////////////////////////////////////
// Get reference
/////////////////////////////////////////////////////////////////
StreamSelectBasedOnType #(
    .enum_type(StreamSelectionPkg::ConfigType),
    .data_type(StreamSelectionPkg::AgentConfig),
    .SELECTION_VALUE(StreamSelectionPkg::REFERENCE_PARAMETER)
) get_ref (
  .clk(clk),
  .resetn(resetn),
  .out(reference),
  .in(reference_in)
);

/////////////////////////////////////////////////////////////////
// Get reference
/////////////////////////////////////////////////////////////////
StreamSelectBasedOnType #(
    .enum_type(StreamSelectionPkg::ConfigType),
    .data_type(StreamSelectionPkg::AgentConfig),
    .SELECTION_VALUE(StreamSelectionPkg::SEARCH_PARAMETER)
) get_search (
  .clk(clk),
  .resetn(resetn),
  .out(search),
  .in(search_in)
);

endmodule

`endif