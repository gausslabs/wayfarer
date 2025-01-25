`ifndef GATE_SEARCH_LAYER
 `define GATE_SEARCH_LAYER

module GateSearchLayer (
  input wire clk,
  input wire resetn,
  input wire next,
  AXI4S.Master out,
  AXI4S.Slave in 
);

//////////////////////////////////////////////////////////////////
// internal values
//////////////////////////////////////////////////////////////////
parameter LFSR_SIZE   = 8;
parameter NUMBER_OF_INPUT_WIRES = 5;
logic [NUMBER_OF_INPUT_WIRES - 1:0] intermediate_wire_values;
logic [1:0] valid_in, shift;
logic valid_enable, ready_enable, a, b, c, valid, ready, interim_valid;

//////////////////////////////////////////////////////////////////
// contol signal management
//////////////////////////////////////////////////////////////////
assign ready = ready_enable & out.ready;
assign valid = ready_enable & in.valid;

assign in.ready = ready;

//////////////////////////////////////////////////////////////////
// data flow
//////////////////////////////////////////////////////////////////

InputWireSelection #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) input_wire_selection (
  .clk(clk),
  .validIn(valid),
  .validOut(interim_valid),
  .resetn(resetn),
  .inputs(in.data),
  .ready(ready),
  .outputs(intermediate_wire_values),
  input wire [CHOICE_WIDTH - 1: 0] a_select,
  input wire [CHOICE_WIDTH - 1: 0] b_select,
  input wire [CHOICE_WIDTH - 1: 0] c_select,
  .a(a),
  .b(b)
);

Toffoli gate_action (
  input wire [3:0] gateChoice,
  .a(a),
  .b(b),
  .c(c)
);

OutputWireSelection  #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) output_wire_selection (
  .clk(clk),
  .validIn(interim_valid),
  .validOut(out.valid),
  .resetn(resetn),
  .ready(ready),
  .inputs(intermediate_wire_values),
  .outputs(out.data),
  input wire [CHOICE_WIDTH - 1: 0] a_select,
  input wire [CHOICE_WIDTH - 1: 0] b_select,
  input wire [CHOICE_WIDTH - 1: 0] c_select,
  .a(a),
  .b(b),
  .c(c)
);

//////////////////////////////////////////////////////////////////
// controller
//////////////////////////////////////////////////////////////////

GateSearchController  controller (
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .validIn(valid_in),
  .validEnable(valid_enable),
  .readyEnable(ready_enable),
  .shift(shift)
);

endmodule

module CircuitPRNG #(
  parameter LFSR_SIZE   = 8
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [3:0] excludeValue,
  input wire [LFSR_SIZE - 1:0] seed,
  output logic [3: 0] gateChoice,
  output wire valid
);

//////////////////////////////////////////////////////////////////
// random number generator
//////////////////////////////////////////////////////////////////
PRNG #(
  .OUTPUT_SIZE(4),
  .LFSR_SIZE(LFSR_SIZE)
) prng (
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .excludeValue(excludeValue),
  .valid(valid),
  .randomNumber(gateChoice)
);

endmodule

module WirePRNG #(
  parameter PERM_SIZE   = 5,
  parameter CHOICE_WIDTH  = $clog2(PERM_SIZE)
  parameter LFSR_SIZE   = 8
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [PERM_SIZE - 1:0] excludeValue,
  input wire [LFSR_SIZE - 1:0] seed,
  output logic [CHOICE_WIDTH - 1: 0] aSelect,
  output logic [CHOICE_WIDTH - 1: 0] bSelect,
  output logic [CHOICE_WIDTH - 1: 0] cSelect,
  output wire valid
);

//////////////////////////////////////////////////////////////////
// safe permutation sheild
//////////////////////////////////////////////////////////////////
logic random_number;
SafePermutationGenerator sheild (
  .selection(random_number),
  .permutation({aSelect,bSelect,cSelect})
);

//////////////////////////////////////////////////////////////////
// random number generator
//////////////////////////////////////////////////////////////////
PRNG #(
  .OUTPUT_SIZE(PERM_SIZE),
  .LFSR_SIZE(LFSR_SIZE)
) prng (
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .excludeValue(excludeValue),
  .valid(valid),
  .randomNumber(random_number)
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
