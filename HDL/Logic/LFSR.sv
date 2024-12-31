`ifndef LFSR_SV
 `define LFSR_SV

module LFSR (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [7:0] seed,
  output logic [7:0] random_number
);

///////////////////////////////////////////////////////////////////////
// Simple LFSR of the polynomial x^8 + x^6 + x^5 + x^4 + 1
///////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(next)
    random_number <= {random_number[6:0],(random_number[7] ^ random_number[5] ^ random_number[4] ^ random_number[3])};
end
else
begin
  random_number <= seed;
end
end


endmodule

`endif