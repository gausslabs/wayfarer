`ifndef GATE_SEARCH_LAYER
 `define GATE_SEARCH_LAYER

module GateSearchLayer (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in 
);


endmodule

module SafePRNG (
  input wire clk,
  input wire resetn,
  input wire next,
  output logic [CHOICE_WIDTH - 1: 0] a_select,
  output logic [CHOICE_WIDTH - 1: 0] b_select,
  output logic [CHOICE_WIDTH - 1: 0] c_select,
  output wire valid
);

SafePermutationGenerator sheild (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [PORT_SIZE- 1:0] [2:0] permutation
);

PRNG #(
    parameter OUTPUT_SIZE = 4,
    parameter LFSR_SIZE   = 8
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [LFSR_SIZE - 1:0] seed,
  input wire [OUTPUT_SIZE - 1:0] excludeValue,
  output wire valid,
  output logic [OUTPUT_SIZE - 1:0] randomNumber
);
endmodule


module GateSearchController #(
  parameter SEED_SIZE = 8
)(
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [1:0] validIn,
  output logic validEnable,
  output logic readyEnable,
  output logic [1:0] shift
);
//////////////////////////////////////////////////////////////////
// FSM
//////////////////////////////////////////////////////////////////

typedef enum bit { 
  PROCESS,
  SHIFT
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
  current_state <= PROCESS;
end
end

always_comb begin
  case (current_state)
    PROCESS:
      next_state = next ? SHIFT : PROCESS;
    SHIFT:
      next_state = (&validIn) ? PROCESS : SHIFT;
    default: begin
      next_state = PROCESS;
    end
  endcase
end

//////////////////////////////////////////////////////////////////
// Output control
//////////////////////////////////////////////////////////////////
logic shift_enable;

assign shift_enable = current_state == SHIFT;

assign validEnable = ~shift_enable;
assign readyEnable = ~shift_enable;
assign shift = {2{shift_enable}} & (~validIn);

endmodule


`endif
