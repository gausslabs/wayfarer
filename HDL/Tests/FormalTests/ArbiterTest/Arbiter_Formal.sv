
`include "Arbiter.sv"

module Arbiter_Formal (
  input wire clk,
  input wire resetn,
  input wire [2:0] req,
  output wire [2:0] grant
);

/////////////////////////////////////////
// DUT
/////////////////////////////////////////

Arbiter3 dut (
  .clk(clk),
  .resetn(resetn),
  .req(req),
  .grant(grant)
);


/////////////////////////////////////////
// Asumptions
/////////////////////////////////////////
initial assume(resetn == 0);


/////////////////////////////////////////
// Assertions
/////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  ////////////////////////////
  // Null Check
  ////////////////////////////
  if (req == 0)
    assert(grant == 0);
  ////////////////////////////
  // Normal Operation
  ////////////////////////////
  if (req != 0)
    assert($onehot(grant));
  ////////////////////////////
  // Transition Check
  ////////////////////////////
  // Holding same value
  if(((req == 3'b100 ) |(req == 3'b010 )|(req == 3'b001 ) | (req == 0)) & req == $past(req) & $stable(resetn))
    assert(grant == $past(grant));
  // rotating through all 
  if((req == 3'b111 ) & $stable(req) & $stable(resetn))
    assert(grant == ($past(grant) << 1 | $past(grant) >> 2));
  ////////////////////////////
  // No 1
  ////////////////////////////
  if(req[0] == 1'b0 )
    assert(grant != 3'b001);
  ////////////////////////////
  // No 2
  ////////////////////////////
  if(req[1] == 1'b0 )
    assert(grant != 3'b010);
  ////////////////////////////
  // No 3
  ////////////////////////////
  if(req[2] == 1'b0 )
    assert(grant != 3'b100);
end
end

endmodule
