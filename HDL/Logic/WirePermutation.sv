`ifndef WIRE_PERMUTATION_SV
 `define WIRE_PERMUTATION_SV

`include "AXIS.sv"

package Wires;

typedef struct packed {
  logic a;
  logic b;
  logic c;
} wires;

endpackage

module InputWireSelection #(
  parameter NUMBER_OF_INPUT_WIRES = 4,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
) (
  input wire clk,
  input wire resetn,
  input wire [NUMBER_OF_INPUT_WIRES - 1: 0] inputs,
  output logic [NUMBER_OF_INPUT_WIRES - 1: 0] outputs,
  input wire [CHOICE_WIDTH - 1: 0] a_select,
  input wire [CHOICE_WIDTH - 1: 0] b_select,
  input wire [CHOICE_WIDTH - 1: 0] c_select,
  output logic a,
  output logic b,
  output logic c
);
///////////////////////////////////////////////////////////////////////
// Registered input selection
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  a <= inputs[a_select];  
  b <= inputs[b_select];
  c <= inputs[c_select];
  // simple registerd pass through for inputs
  outputs <= inputs;
end
else
begin
  a <= 0;  
  b <= 0;
  c <= 0;
  outputs <= 0;
end
end

endmodule

module OutputWireSelection #(
  parameter NUMBER_OF_INPUT_WIRES = 4,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
) (
  input wire clk,
  input wire resetn,
  input wire [NUMBER_OF_INPUT_WIRES - 1: 0] inputs,
  output logic [NUMBER_OF_INPUT_WIRES - 1: 0] outputs,
  input wire [CHOICE_WIDTH - 1: 0] a_select,
  input wire [CHOICE_WIDTH - 1: 0] b_select,
  input wire [CHOICE_WIDTH - 1: 0] c_select,
  input wire a,
  input wire b,
  input wire c
);

///////////////////////////////////////////////////////////////////////
// selecting ouput
///////////////////////////////////////////////////////////////////////
wire [NUMBER_OF_INPUT_WIRES - 1: 0] selected_outputs;
genvar i;

generate;
  for(i = 0; i < NUMBER_OF_INPUT_WIRES; i++)
  begin
    assign selected_outputs[i] = (a_select == i)? a :( (b_select == i) ? b :( (c_select == i) ? c : (inputs[i]) ));
  end
endgenerate

///////////////////////////////////////////////////////////////////////
// registering the ouput
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  outputs <= selected_outputs;
end
else
begin
  outputs <= 0;
end
end

endmodule

`endif