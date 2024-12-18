`ifndef {{module_name | upper }}_SV
  `define {{module_name | upper }}_SV

module {{module_name}} #(
  parameter PERM_SIZE = {{perm_size}},
  parameter PORT_SIZE = {{port_size}}
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [PORT_SIZE- 1:0] [2:0] permutation
);

always_comb
begin
case(selection):
{% for case in cases %}
  8'd{{case.index}}:
  begin
    {% for permutation in case.permutations %}
    permutation[{{permutation.index}}] = {{permutation.value}};
    {% endfor %}
  end
{% endfor %}
  default:
  begin
    {% for permutation in default.permutations %}
    permutation[{{permutation.index}}] = {{permutation.value}};
    {% endfor %}
  end
endcase
end

endmodule


`endif