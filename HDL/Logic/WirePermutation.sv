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
  input wire validIn,
  output logic validOut,
  input wire ready,
  input wire [NUMBER_OF_INPUT_WIRES - 1: 0] inputs,
  output logic [NUMBER_OF_INPUT_WIRES - 1: 0] outputs,
  input wire [CHOICE_WIDTH - 1: 0] aSelect,
  input wire [CHOICE_WIDTH - 1: 0] bSelect,
  output logic a,
  output logic b
);
///////////////////////////////////////////////////////////////////////
// Registered input selection
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  validOut <= validIn;
  if (ready)
  begin
    a <= inputs[aSelect];  
    b <= inputs[bSelect];
    // simple registerd pass through for inputs
    outputs <= inputs;
  end
end
else
begin
  a <= 0;  
  b <= 0;
  outputs <= 0;
  validOut <= 0;
end
end

endmodule

module OutputWireSelection #(
  parameter NUMBER_OF_INPUT_WIRES = 4,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
) (
  input wire clk,
  input wire resetn,
  input wire validIn,
  output logic validOut,
  input wire ready,
  input wire [NUMBER_OF_INPUT_WIRES - 1: 0] inputs,
  output logic [NUMBER_OF_INPUT_WIRES - 1: 0] outputs,
  input wire [CHOICE_WIDTH - 1: 0] aSelect,
  input wire [CHOICE_WIDTH - 1: 0] bSelect,
  input wire [CHOICE_WIDTH - 1: 0] cSelect,
  input wire passThrough,
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
    assign selected_outputs[i] = (aSelect == i)? a :( (bSelect == i) ? b :( (cSelect == i) ? c : (inputs[i]) ));
  end
endgenerate

///////////////////////////////////////////////////////////////////////
// registering the ouput
///////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  validOut <= validIn;
  if(ready)
    outputs <= passThrough ? selected_outputs : inputs;
end
else
begin
  outputs <= 0;
  validOut <= 0;
end
end

endmodule

`endif