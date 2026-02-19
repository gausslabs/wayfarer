`ifndef SEARCH_AGENT
 `define SEARCH_AGENT

// ┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐
// │                                                                                                          │
// │                                                                                                          │
// │                                                                                                          │
// │  ┌────────┐             ┌───────────────────────────┐     ┌───────────────────────┐                      │
// │  │  S     │             │   Search                  │     │  Reference            │     ┌───────────┐    │
// │  │  o     │    ┌─────┐  │   Circuit                 │     │  Circuit              │     │           │    │
// │  │  u     │    │  T  ┼──►                           ┼─────►                       ┼─────► Comparator│    │
// │  │  r     ┼────►  e  │  │                           │     │                       │     │           │    │
// │  │  c     │    │  e  ┼──►                           ┼─────►                       ┼─────►           │    │
// │  │  e     │    └─────┘  │                           │     │                       │     │           │    │
// │  └────────┘             │                           │     │                       │     └───────────┘    │
// │                         └──────────────▲────────────┘     └─────────▲─────────────┘                      │
// │                                        │                            │                                    │
// │                                   ┌────┴──────┐                ┌────┴──────┐                             │
// │                                   │Search     │                │Reference  │                             │
// │                                   │Selector   │                │Selector   │                             │
// │                                   └─────▲─────┘                └──────▲────┘                             │
// │                                         │                             │                                  │
// │                                         └─────────┬────────┬──────────┘               ┌─────────────┐    │
// │                                                   │ Tee    │                          │             │    │
// │                                                   │        │                          │ Controller  │    │
// │                                                   └───▲────┘                          │             │    │
// │                                                       │                               │             │    │
// │                                       ┌───────────────┼─────────────────┐             │             │    │
// │                                       │                                 │             │             ┼────┼─────► Result stream
// │                                       │  Agent ID                       │             │             │    │
// │                                       │  Selector                       │             └─────────────┘    │
// │                                       │                                 │                                │
// │                                       └───────────────▲─────────────────┘                                │
// │                                                       │                                                  │
// └───────────────────────────────────────────────────────│──────────────────────────────────────────────────┘
//                                                       Config Stream
(* DONT_TOUCH = "TRUE" *)
module SearchAgent #(
    type id_type   = StreamSelectionPkg::agentID,
    parameter id_type SELECTION_VALUE = 'd2
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master result,
  AXI4S.Slave configStream
);

//////////////////////////////////////////////////////////////////////////////////////
// Internal nets
//////////////////////////////////////////////////////////////////////////////////////
localparam NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES;
localparam LIMIT = NUMBER_OF_STAGES;
(* DONT_TOUCH = "TRUE" *) AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::StreamData))) selceted_stream();
(* DONT_TOUCH = "TRUE" *) AXI4S #(.DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig)))  extracted_stream(), extracted_stream_buffered(), reference_stream(), search_stream(), reference_stream_selected(), search_stream_selected();
(* DONT_TOUCH = "TRUE" *) AXI4S #(.DATA_WIDTH(AgentPkg::NUMBER_OF_INPUT_WIRES)) source(), passthrough_search(), search_source(), passthrough_ref(), ref_source(), passthrough_comparator(), comparator_source();
AgentPkg::GateConfig gateConfigs [NUMBER_OF_STAGES - 1:0];
StreamSelectionPkg::AgentConfig incoming_config;
logic lastReached, equal, foundCircuit ,loadRef ,loadSearch ,sample ,start, sampled;

//////////////////////////////////////////////////////////////////////////////////////
// Flow management of config
//////////////////////////////////////////////////////////////////////////////////////

StreamDataExtractionBasedOnID #(
  .data_type(StreamSelectionPkg::StreamData),
  .id_type(id_type),
  .SELECTION_VALUE(SELECTION_VALUE)
) select_right_stream (
  .clk(clk),
  .resetn(resetn),
  .out(selceted_stream),
  .in(configStream)
);

ExtractAgentConfig #(
  .in_data_type(StreamSelectionPkg::StreamData),
  .out_data_type(StreamSelectionPkg::AgentConfig)
) extract_agent_config (
  .clk(clk),
  .resetn(resetn),
  .in(selceted_stream),
  .out(extracted_stream)
);

AXISFIFO #(
  .DATA_WIDTH($bits(StreamSelectionPkg::AgentConfig)),
  .MODE(FIFOPkg::DATA_AND_LAST)
) buffer (
  .clk(clk),
  .resetn(resetn),
  .in(extracted_stream),
  .out(extracted_stream_buffered)
);

(* DONT_TOUCH = "TRUE" *) Tee config_splitter (
  .streamOne(reference_stream),
  .streamTwo(search_stream),
  .in(extracted_stream_buffered)
);

StreamSelectBasedOnType #(
    .enum_type(StreamSelectionPkg::ConfigType),
    .data_type(StreamSelectionPkg::AgentConfig),
    .SELECTION_VALUE(StreamSelectionPkg::REFERENCE_PARAMETER)
) reference_selector (
  .clk(clk),
  .resetn(resetn),
  .out(reference_stream_selected),
  .in(reference_stream) 
);

StreamSelectBasedOnType #(
    .enum_type(StreamSelectionPkg::ConfigType),
    .data_type(StreamSelectionPkg::AgentConfig),
    .SELECTION_VALUE(StreamSelectionPkg::SEARCH_PARAMETER)
) search_selector (
  .clk(clk),
  .resetn(resetn),
  .out(search_stream_selected),
  .in(search_stream) 
);

//////////////////////////////////////////////////////////////////////////////////////
// Data flow layer
//////////////////////////////////////////////////////////////////////////////////////
(* DONT_TOUCH = "TRUE" *) LinearSource #(
  .DATA_WIDTH(AgentPkg::NUMBER_OF_INPUT_WIRES)
) lin_source (
  .clk(clk),
  .resetn(resetn),
  .out(source)
);

(* DONT_TOUCH = "TRUE" *) Tee source_splitter (
  .streamOne(passthrough_search),
  .streamTwo(search_source),
  .in(source)
);

(* DONT_TOUCH = "TRUE" *) SearchCircuitLayer search_circuit (
  .clk(clk),
  .resetn(resetn),
  .load((~start) & loadSearch),
  .next(sample),
  .loaded(),
  .readyToProcess(),
  .out(ref_source),
  .passThroughOut(passthrough_ref),
  .in(passthrough_search),
  .passThroughIn(search_source),
  .configuration(search_stream_selected)
);

(* DONT_TOUCH = "TRUE" *) ReferenceCircuitLayer reference_circuit (
  .clk(clk),
  .resetn(resetn),
  .start(start & (~loadRef)),
  .loaded(sampled),
  .out(comparator_source),
  .passThroughOut(passthrough_comparator),
  .in(ref_source),
  .passThroughIn(passthrough_ref),
  .configuration(reference_stream_selected)
);

(* DONT_TOUCH = "TRUE" *) AXISComparator comparator (
  .clk(clk),
  .resetn(resetn),
  .in1(comparator_source),
  .in2(passthrough_comparator),
  .lastReached(lastReached),
  .equal(equal)
);

//////////////////////////////////////////////////////////////////////////////////////
// Control
//////////////////////////////////////////////////////////////////////////////////////
assign incoming_config = extracted_stream_buffered.data;

(* DONT_TOUCH = "TRUE" *) SearchAgenrController controller (
  .clk(clk),
  .resetn(resetn),
  .equal(equal),
  .lastSampleReached(lastReached),
  .configType(incoming_config.configType),
  .circuitSent(result.last & result.valid & result.ready),
  .sampled(sampled),
  .configValid(extracted_stream_buffered.valid & extracted_stream_buffered.ready),
  .configLast(extracted_stream_buffered.last),
  .foundCircuit(foundCircuit),
  .loadRef(loadRef),
  .loadSearch(loadSearch),
  .sample(sample),
  .start(start)
);

//////////////////////////////////////////////////////////////////////////////////////
// Sending results
//////////////////////////////////////////////////////////////////////////////////////
AXI4S #(.DATA_WIDTH($clog2(LIMIT))) addr();
LinearSource #(
    .LIMIT(NUMBER_OF_STAGES),
    .DATA_WIDTH($clog2(LIMIT))
) output_addr (
  .clk(clk),
  .resetn(resetn & foundCircuit),
  .out(addr)
);

always_ff @ (posedge clk)
begin
if(resetn & foundCircuit)
begin
  if (addr.ready)
  begin
    result.valid <= addr.valid;
    if (addr.data  <= LIMIT)
      result.data <= gateConfigs[addr.data];
    result.last <= addr.last;
  end
end
else
begin
  result.valid <= 0;
  result.data <= 0;
  result.last <= 0;
end
end

assign addr.ready = result.ready;

endmodule


module SearchAgenrController (
  input wire clk,
  input wire resetn,
  input wire equal,
  input wire lastSampleReached,
  input StreamSelectionPkg::ConfigType configType,
  input wire circuitSent,
  input wire sampled,
  input wire configValid,
  input wire configLast,
  output logic foundCircuit,
  output logic loadRef,
  output logic loadSearch,
  output logic sample,
  output logic start
);

//////////////////////////////////////////////////////////////////////////////////////
// FSM
//////////////////////////////////////////////////////////////////////////////////////
typedef enum logic [3:0] { 
LOAD,
REFERENCE_CONFIG,
SEARCH_CONFIG,
PROCESS,
SAMPLE,
FOUND
} State;

State current_state, next_state;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= LOAD;
end
end

always_comb begin
    case (current_state)
        LOAD:
            next_state = configValid ? (configType == StreamSelectionPkg::REFERENCE_PARAMETER ? REFERENCE_CONFIG : SEARCH_CONFIG) : LOAD;
        REFERENCE_CONFIG:
            next_state = (configValid & configLast) ? PROCESS : REFERENCE_CONFIG;
        SEARCH_CONFIG:
            next_state = (configValid & configLast) ? PROCESS : SEARCH_CONFIG;
        PROCESS:
            next_state = configValid ? LOAD : (equal ? (lastSampleReached ? FOUND : PROCESS) : SAMPLE);
        SAMPLE:
            next_state = sampled ? PROCESS : SAMPLE;
        FOUND:
            next_state = circuitSent ? SAMPLE : FOUND;
        default: begin
            next_state = LOAD;
        end
    endcase
end

assign foundCircuit = current_state == FOUND;
assign sample = current_state == SAMPLE;
assign start = current_state == PROCESS;
assign loadRef = current_state == REFERENCE_CONFIG;
assign loadSearch = current_state == SEARCH_CONFIG;


endmodule

module LinearSource #(
    parameter DATA_WIDTH = 5,
    parameter LIMIT = (1 << DATA_WIDTH) - 1
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);
//////////////////////////////////////////////////////////////////////////////////////
// Internal nets
//////////////////////////////////////////////////////////////////////////////////////
logic [DATA_WIDTH:0] counter;


always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (out.ready)
  begin
    if (counter <= LIMIT)
      counter <= counter + 1;
  end
end
else
begin
  counter <= 0;
end
end

assign out.valid = resetn & (counter <= LIMIT);
assign out.data = counter;
assign out.last = (counter == LIMIT);

endmodule

`endif