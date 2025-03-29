`ifndef LFSR_MOD11
 `define LFSR_MOD11


module LFSR10MOD11 (
  input wire clk,
  input wire resetn,
  input wire [9:0] seed,
  AXI4S.Master out
);

///////////////////////////////////////////////////////////////////////
// Simple LFSR of the polynomial x^10 + x^9 + x^7 + x^6 + 1
///////////////////////////////////////////////////////////////////////
logic [9:0] state;
AXI4S #(.DATA_WIDTH(10)) lfsr_state();

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(lfsr_state.ready)
    state <= {state[8:0],(state[9] ^ state[8] ^ state[6] ^ state[5])};
end
else
begin
  state <= seed;
end
end

assign lfsr_state.data = state;
assign lfsr_state.valid = resetn;

///////////////////////////////////////////////////////////////////////
// state % 11
///////////////////////////////////////////////////////////////////////
Mod11 mod_11(
  .clk(clk),
  .resetn(resetn),
  .out(out),
  .in(lfsr_state) 
);


endmodule

`endif