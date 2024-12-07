`ifndef LFSR_WRAPPER_SV
 `define LFSR_WRAPPER_SV

module LFSRWrapper #(
    parameter bit [7:0] SEED = 45
) (
  input wire clk,
  input wire resetn,
  AXI4S.Master out
);

LFSR dut (
  .clk(clk),
  .resetn(resetn),
  .next(out.ready),
  .seed(SEED),
  .random_number(out.data)
);

assign out.valid = resetn;

endmodule


`endif