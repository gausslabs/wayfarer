`ifndef STREAMING_REFERENCE_CIRCUIT_WRAPPER
 `define STREAMING_REFERENCE_CIRCUIT_WRAPPER

module SearchCircuitWrapper #(
  type type_of_store = AgentPkg::SearchConfigStore,
  type input_config_type = StreamSelectionPkg::AgentConfig,
  parameter CONFIG_COUNT_SIZE = AgentPkg::SEED_CONFIG_IN_BYTES,
  parameter STAGES_ID_WIDTH = AgentPkg::STAGES_ID_WIDTH,
  parameter NUMBER_OF_STAGES = AgentPkg::NUMBER_OF_STAGES,
  parameter LFSRPkg::LFSRType LFSR_TYPE  = AgentPkg::LFSR_TYPE,
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = AgentPkg::PERMUTATION_TYPE,
  parameter NUMBER_OF_INPUT_WIRES = AgentPkg::NUMBER_OF_INPUT_WIRES,
  parameter CHOICE_WIDTH = AgentPkg::CHOICE_WIDTH
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Master passThroughOut,
  AXI4S.Slave in,
  AXI4S.Slave passThroughIn,
  AXI4S.Slave configStream
);
typedef enum logic [1:0] { 
    WAIT_FOR_LAST_CONFIG,
    LOADED,
    STARTING
 } TestControl;
logic loaded;
 TestControl current_state, next_state;

SearchCircuitLayer #(
  .type_of_store(type_of_store),
  .input_config_type(input_config_type),
  .CONFIG_COUNT_SIZE(CONFIG_COUNT_SIZE),
  .STAGES_ID_WIDTH(STAGES_ID_WIDTH),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
  .LFSR_TYPE(LFSR_TYPE),
  .PERMUTATION_TYPE(PERMUTATION_TYPE),
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
  .CHOICE_WIDTH(CHOICE_WIDTH)
) dut (
  .clk(clk),
  .resetn(resetn),
  .next(0),
  .load(current_state == STARTING),
  .loaded(loaded),
  .out(out),
  .passThroughOut(passThroughOut),
  .in(in),
  .passThroughIn(passThroughIn),
  .configuration(configStream)
);



always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= WAIT_FOR_LAST_CONFIG;
end
end

always_comb begin
case (current_state)
    WAIT_FOR_LAST_CONFIG:
        next_state = (configuration.valid & configuration.last) ? LOADED : WAIT_FOR_LAST_CONFIG;
    LOADED:
        next_state = loaded ? STARTING : LOADED;
    STARTING:
        next_state = STARTING;
    default: begin
        next_state = WAIT_FOR_LAST_CONFIG;
    end
endcase
end


endmodule

`endif