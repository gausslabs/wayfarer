`ifndef GATE_SEARCH_LAYER
 `define GATE_SEARCH_LAYER

package GatePkg;

localparam GATE_DELAY = 2; // The input wire selection delay(1) + The output wire selection delay(1) 

endpackage

module StreamingGate #(
  parameter NUMBER_OF_INPUT_WIRES = 5,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
)(
  input wire clk,
  input wire resetn,
  input wire passThrough,
  input wire [3:0] gateChoice,
  input wire [CHOICE_WIDTH - 1: 0] aSelect,
  input wire [CHOICE_WIDTH - 1: 0] bSelect,
  input wire [CHOICE_WIDTH - 1: 0] cSelect,
  AXI4S.Master out,  
  AXI4S.Master passThroughOut,
  AXI4S.Slave in, 
  AXI4S.Slave passThroughIn 
);
/////////////////////////////////////////////////////////////////
// Getting constants
/////////////////////////////////////////////////////////////////
import GatePkg::GATE_DELAY;

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) pass_through[GATE_DELAY -1:0]();

/////////////////////////////////////////////////////////////////
// Creating the delayed stream
/////////////////////////////////////////////////////////////////
genvar i;

for (i=0; i<GATE_DELAY; ++i) begin
  if(i == 0)
  begin
    Passthrough first_PassThrough(
    .clk(clk),
    .resetn(resetn),
    .out(pass_through[i]),
    .in(passThroughIn)
    );
  end
  else 
  begin
    Passthrough next_PassThrough(
    .clk(clk),
    .resetn(resetn),
    .out(pass_through[i]),
    .in(pass_through[i-1])
    );
  end
end

StreamConnector last_pasthough (
  .in(pass_through[GATE_DELAY-1]),
  .out(passThroughOut)
);

/////////////////////////////////////////////////////////////////
// Gate stream
/////////////////////////////////////////////////////////////////
Gate #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES),
  .CHOICE_WIDTH(CHOICE_WIDTH)
) gate_layer (
  .clk(clk),
  .resetn(resetn),
  .ready(out.ready),
  .readyOut(in.ready),
  .validIn(in.valid),
  .validOut(out.valid),
  .passThrough(passThrough),
  .gateChoice(gateChoice),
  .aSelect(aSelect),
  .bSelect(bSelect),
  .cSelect(cSelect),
  .inputWires(in.data),
  .outputWires(out.data)
);

endmodule

module Gate #(
  parameter NUMBER_OF_INPUT_WIRES = 5,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
)(
  input wire clk,
  input wire resetn,
  input wire ready,
  output wire readyOut,
  input wire validIn,
  output logic validOut,
  input wire passThrough,
  input wire [3:0] gateChoice,
  input wire [CHOICE_WIDTH - 1: 0] aSelect,
  input wire [CHOICE_WIDTH - 1: 0] bSelect,
  input wire [CHOICE_WIDTH - 1: 0] cSelect,
  input wire [NUMBER_OF_INPUT_WIRES - 1:0] inputWires,
  output logic [NUMBER_OF_INPUT_WIRES - 1:0] outputWires
);
//////////////////////////////////////////////////////////////////
// internal values
//////////////////////////////////////////////////////////////////
logic [NUMBER_OF_INPUT_WIRES - 1:0] intermediate_wire_values;
logic a, b, c, interim_valid, target;

//////////////////////////////////////////////////////////////////
// data flow
//////////////////////////////////////////////////////////////////
InputWireSelection #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) input_wire_selection (
  .clk(clk),
  .validIn(validIn),
  .validOut(interim_valid),
  .resetn(resetn),
  .inputs(inputWires),
  .ready(ready),
  .outputs(intermediate_wire_values),
  .aSelect(aSelect),
  .bSelect(bSelect),
  .cSelect(cSelect),
  .a(a),
  .b(b),
  .c(c)
);

Toffoli gate_action (
  .gateChoice(gateChoice),
  .a(a),
  .b(b),
  .c(c),
  .target(target)
);

OutputWireSelection  #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) output_wire_selection (
  .clk(clk),
  .validIn(interim_valid),
  .validOut(validOut),
  .resetn(resetn),
  .ready(ready),
  .inputs(intermediate_wire_values),
  .outputs(outputWires),
  .select(cSelect),
  .passThrough(passThrough),
  .c(target)
);

assign readyOut = ready;

endmodule

module SearchGate #(
  parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_16,
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = PermutationPkg::WIRES_13,
  parameter NUMBER_OF_INPUT_WIRES = PermutationPkg::number_of_wires(PERMUTATION_TYPE),
  parameter CHOICE_WIDTH = $clog2(NUMBER_OF_INPUT_WIRES),
  parameter LFSR_SIZE   = LFSRPkg::port_bit_width(LFSR_TYPE)
) (
  input wire clk,
  input wire resetn,
  input wire load,
  input wire next,
  input wire [LFSR_SIZE - 1:0] gateSeed,
  input wire [LFSR_SIZE - 1:0] wireSeed,
  output logic readyToProcess,
  AXI4S.Master out,  
  AXI4S.Master passThroughOut,
  AXI4S.Slave in, 
  AXI4S.Slave passThroughIn 
);

//////////////////////////////////////////////////////////////////
// internal values
//////////////////////////////////////////////////////////////////
logic [CHOICE_WIDTH - 1:0] a_select, b_select, c_select;
logic [3:0] gate_choice;
logic readSeed;
logic [1:0] valid, shift;
//////////////////////////////////////////////////////////////////
// controller
//////////////////////////////////////////////////////////////////
GateSearchController controller(
  .clk(clk),
  .resetn(resetn),
  .load(load),
  .next(next),
  .validIn(valid),
  .ready(readyToProcess),
  .readSeed(readSeed),
  .shift(shift)
);

//////////////////////////////////////////////////////////////////
// data flow
//////////////////////////////////////////////////////////////////

StreamingGate #(
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) data_flow (
   .clk(clk),
  .resetn(resetn & (~next) & (~load)),
  .passThrough(0),
  .gateChoice(gate_choice),
  .aSelect(a_select),
  .bSelect(b_select),
  .cSelect(c_select),
  .out(out),  
  .passThroughOut(passThroughOut),
  .in(in), 
  .passThroughIn(passThroughIn) 
);

//////////////////////////////////////////////////////////////////
// PRNGs
//////////////////////////////////////////////////////////////////

CircuitPRNG #(
  .LFSR_TYPE(LFSR_TYPE)
) circuit_rng (
  .clk(clk),
  .resetn(resetn & (~readSeed)),
  .next(shift[0]),
  .seed(gateSeed),
  .gateChoice(gate_choice),
  .valid(valid[0])
);

WirePRNG #(
  .PERMUTATION_TYPE(PERMUTATION_TYPE),
  .LFSR_TYPE(LFSR_TYPE)
) wire_rng (
  .clk(clk),
  .resetn(resetn & (~readSeed)),
  .next(shift[1]),
  .seed(wireSeed),
  .aSelect(a_select),
  .bSelect(b_select),
  .cSelect(c_select),
  .valid(valid[1])
);

endmodule

module CircuitPRNG #(
  parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_16,
  parameter LFSR_SIZE = LFSRPkg::port_bit_width(LFSR_TYPE)
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [LFSR_SIZE - 1:0] seed,
  output logic [3: 0] gateChoice,
  output wire valid
);

//////////////////////////////////////////////////////////////////
// random number generator
//////////////////////////////////////////////////////////////////
SimplePRNG #(
  .OUTPUT_SIZE(4),
  .LFSR_TYPE(LFSR_TYPE)
) prng (
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .valid(valid),
  .randomNumber(gateChoice)
);

endmodule

module WirePRNG #(
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = PermutationPkg::WIRES_13,
  parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_16,
  parameter PERM_SIZE = PermutationPkg::permutaion_bit_width(PERMUTATION_TYPE),
  parameter CHOICE_WIDTH  = PermutationPkg::port_bit_width(PERMUTATION_TYPE),
  parameter LFSR_SIZE   = LFSRPkg::port_bit_width(LFSR_TYPE)
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [LFSR_SIZE - 1:0] seed,
  output logic [CHOICE_WIDTH - 1: 0] aSelect,
  output logic [CHOICE_WIDTH - 1: 0] bSelect,
  output logic [CHOICE_WIDTH - 1: 0] cSelect,
  output wire valid
);

//////////////////////////////////////////////////////////////////
// safe permutation sheild
//////////////////////////////////////////////////////////////////
logic[PERM_SIZE - 1:0] random_number;
SafePermutationGenerator #(
  .PERMUTATION_TYPE(PERMUTATION_TYPE)
) sheild (
  .selection(random_number),
  .permutation({cSelect,bSelect,aSelect})
);

//////////////////////////////////////////////////////////////////
// random number generator
//////////////////////////////////////////////////////////////////
SimplePRNG #(
  .LFSR_TYPE(LFSR_TYPE),
  .ENABLE_MODULO(1),
  .MODULO_VALUE(PermutationPkg::total_number_of_permutaion(PERMUTATION_TYPE)),
  .OUTPUT_SIZE(PERM_SIZE)
) prng (
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .valid(valid),
  .randomNumber(random_number)
);
endmodule


module GateSearchController (
  input wire clk,
  input wire resetn,
  input wire load,
  input wire next,
  input wire [1:0] validIn,
  output logic ready,
  output logic readSeed,
  output logic [1:0] shift
);
//////////////////////////////////////////////////////////////////
// FSM
//////////////////////////////////////////////////////////////////

typedef enum logic [1:0] {
  LOAD_SEED,
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
      next_state = load ? LOAD_SEED : (next ? SHIFT : PROCESS);
    LOAD_SEED:
      next_state = load ?  LOAD_SEED : PROCESS;
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

assign readSeed = current_state == LOAD_SEED;

assign ready = current_state == PROCESS;

assign shift = {2{shift_enable}} & (~validIn);

endmodule


`endif
