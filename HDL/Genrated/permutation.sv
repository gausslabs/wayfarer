`ifndef SAFEPERMUTATIONGENERATOR_SV
  `define SAFEPERMUTATIONGENERATOR_SV

package PermutationPkg;

typedef enum logic [1:0] { 
  WIRES_05,
  WIRES_11,
  WIRES_13
 } SafePermutaions;

 function int permutaion_bit_width (input SafePermutaions s);
  case (s)
    WIRES_05:
       permutaion_bit_width = $clog2(5*4*3);
    WIRES_11:
       permutaion_bit_width = $clog2(11*10*9);
    WIRES_13:
       permutaion_bit_width = $clog2(13*12*11);
  endcase
 endfunction

  function int port_bit_width (input SafePermutaions s);
  case (s)
    WIRES_05:
       permutaion_bit_width = $clog2(5);
    WIRES_11:
       permutaion_bit_width = $clog2(11);
    WIRES_13:
       permutaion_bit_width = $clog2(13);
  endcase
 endfunction

endpackage

module SafePermutationGenerator #(
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = PermutationPkg::WIRES_13,
  parameter PERM_SIZE = permutaion_bit_width(PERMUTATION_TYPE),
  parameter PORT_SIZE = port_bit_width(PERMUTATION_TYPE)
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [PORT_SIZE- 1:0] [2:0] permutation
);

if (PERMUTATION_TYPE == PermutationPkg::WIRES_13)
begin
  SafePermutationGenerator13 perm_13 (
  .selection(selection),
  .permutation(permutation)
  );
end
else if (PERMUTATION_TYPE == PermutationPkg::WIRES_11) 
begin
  SafePermutationGenerator11 perm_11 (
  .selection(selection),
  .permutation(permutation)
  );
end
else
begin
  SafePermutationGenerator05 perm_05 (
  .selection(selection),
  .permutation(permutation)
  );
end

endmodule


`endif