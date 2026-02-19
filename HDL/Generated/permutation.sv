`ifndef SAFEPERMUTATIONGENERATOR_SV
  `define SAFEPERMUTATIONGENERATOR_SV

module SafePermutationGenerator #(
  parameter PermutationPkg::SafePermutaions PERMUTATION_TYPE = PermutationPkg::WIRES_13,
  parameter PERM_SIZE = PermutationPkg::permutaion_bit_width(PERMUTATION_TYPE),
  parameter PORT_SIZE = PermutationPkg::port_bit_width(PERMUTATION_TYPE)
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
  SafePermutationGenerator5 perm_05 (
  .selection(selection),
  .permutation(permutation)
  );
end

endmodule


`endif