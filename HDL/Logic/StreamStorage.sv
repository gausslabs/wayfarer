`ifndef STREAM_STORAGE
 `define STREAM_STORAGE

//                                                          ┌──────────────┐
//                               ┌───────┐                  │Config-Extract│
// ┌─────┐                       │       ┼─────────────────►│              │
// │FIFO │                       │Stream │                  │              │
// │     │────┐[Stream    ]──────►Mux    ┼───────────┐      └──────────────┘
// │     │    │                  │       │           │
// └─────┘    │                  │       │           │
//            │                  │       ┼────────┐  │      ┌──────────────┐
//            │                  └──▲────┘        │  │      │Config-Extract│
//            │                     │             │  └──────►              │
//            │                     │             │         │              │
//            │                     │             │         └──────────────┘
//            └──Stream─ID──────────┘             │
//                                                │         ┌──────────────┐
//                                                │         │Config-Extract│
//                                                └─────────►              │
//                                                          │              │
//                                                          └──────────────┘

module ReferenceStorage #(
    type type_of_store = AgentPkg::GateConfigStore,
    type input_data_type = StreamSelectionPkg::AgentConfig,
    parameter CONFIG_COUNT_SIZE = AgentPkg::GATE_CONFIG_COUNT_SIZE,
    parameter STAGES_ID_WIDTH = AgentPkg::STAGES_ID_WIDTH,
    parameter NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES
) (
  input wire           clk,
  input wire           resetn,
  output logic [NUMBER_OF_STAGES - 1:0]  validOut,
  output type_of_store out [NUMBER_OF_STAGES - 1:0],
  AXI4S.Slave          in
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
localparam DATA_WIDTH = $bits(input_data_type);
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) de_mux_stream  [NUMBER_OF_STAGES - 1:0]();
AXI4S #(.DATA_WIDTH(DATA_WIDTH)) internal();
input_data_type in_data;

/////////////////////////////////////////////////////////////////
// FSM
/////////////////////////////////////////////////////////////////
typedef enum logic [1:0] { 
    WAITING,
    CLEAR_CONFIG,
    PROCESS_INPUT
 } FSM;
FSM current_state, next_state;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= WAITING;
end
end

// Assumption made is that the last of the stream comes when the last stage id is being sent.
always_comb
begin
case (current_state)
    WAITING:
        next_state = internal.valid ? CLEAR_CONFIG : WAITING;
    CLEAR_CONFIG:
        next_state = PROCESS_INPUT;
    PROCESS_INPUT:
        next_state = (de_mux_stream[NUMBER_OF_STAGES - 1].valid & de_mux_stream[NUMBER_OF_STAGES - 1].last) ? WAITING : PROCESS_INPUT;
    default: begin
        next_state = WAITING;
    end
endcase
end

/////////////////////////////////////////////////////////////////
// buffer
///////////////////////////////////////////////////////////////// 
AXISFIFO #(
  .DATA_WIDTH(DATA_WIDTH),
  .MODE(FIFOPkg::DATA_AND_LAST),
  .STORE_SIZE(8)
)buffer(
  .clk(clk),
  .resetn(resetn),
  .out(internal),
  .in(in) 
);


assign in_data = internal.data;


/////////////////////////////////////////////////////////////////
// de-mux
/////////////////////////////////////////////////////////////////
StreamDeMux #(
  .TOTAL_OUTPUT_STREAM(NUMBER_OF_STAGES),
  .SELECTION_SIZE(STAGES_ID_WIDTH)
)de_mux(
  .clk(clk),
  .resetn(resetn),
  .enableSelection(current_state == PROCESS_INPUT),
  .selection(in_data.id),
  .out(de_mux_stream),
  .in(internal) 
);

/////////////////////////////////////////////////////////////////
// Creating the reference extraction blocks
/////////////////////////////////////////////////////////////////
genvar i;
for (i=0; i<NUMBER_OF_STAGES; i++) begin
    ReferenceConfigExtraction #(
    .type_of_store(type_of_store),
    .input_data_type(input_data_type),
    .ADDR_SIZE(CONFIG_COUNT_SIZE)
    )ref_extraction(
      .clk(clk),
      .resetn(resetn & (current_state != CLEAR_CONFIG)),
      .validOut(validOut[i]),
      .out(out[i]),
      .in(de_mux_stream[i]) 
    );
end


endmodule


`endif