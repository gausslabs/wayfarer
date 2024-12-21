`ifndef PRNG_WRAPPER_SV
 `define PRNG_WRAPPER_SV

module PRNGWrapper #(
    parameter bit [7:0] SEED = 45,
    parameter OUTPUT_SIZE = 4,
    parameter bit[OUTPUT_SIZE - 1:0] EXCLUDE = 8,
    parameter LFSR_SIZE   = 8
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);

PRNG #(
    parameter OUTPUT_SIZE = 4,
    parameter LFSR_SIZE   = 8
) dut (
  .clk(clk),
  .resetn(resetn),
  .next(out.ready),
  .seed(SEED),
  .excludeValue(EXCLUDE),
  .valid(out.valid),
  .random_number(out.data)
);

endmodule


`endif