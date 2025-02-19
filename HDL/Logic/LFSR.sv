`ifndef LFSR_SV
 `define LFSR_SV

module LFSR #(
  parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_08,
  parameter DATA_WIDTH = LFSRPkg::port_bit_width(LFSR_TYPE)
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [DATA_WIDTH - 1:0] seed,
  output logic [DATA_WIDTH - 1:0] random_number
);

if (LFSR_TYPE == LFSRPkg::LFSR_16)
begin
LFSR16 lfsr16(
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .random_number(random_number)
);
end
else 
begin
LFSR8 lfsr8(
  .clk(clk),
  .resetn(resetn),
  .next(next),
  .seed(seed),
  .random_number(random_number)
);
end


endmodule


module LFSR16 (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [15:0] seed,
  output logic [15:0] random_number
);

///////////////////////////////////////////////////////////////////////
// Simple 16 bit LFSR of the polynomial x^16 + x^14 + x^13 + x^11 + 1
///////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(next)
    random_number <= {random_number[14:0],(random_number[15] ^ random_number[13] ^ random_number[12] ^ random_number[10])};
end
else
begin
  random_number <= seed;
end
end


endmodule

module LFSR8 (
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