`ifndef TOFFOLI_SV
  `define TOFFOLI_SV

module Toffoli (
  input wire [3:0] gateChoice,
  input wire a,
  input wire b,
  output logic c
);

///////////////////////////////////////////////////////////////////////
// This just a combinational implementation of the gate with choice
///////////////////////////////////////////////////////////////////////

always_comb 
begin
  case (gateChoice)
    4'd0:
      c = 0;
    4'd1:
      c = a & b;
    4'd2:
      c = a & (~b);
    4'd3:
      c = a;
    4'd4:
      c = (~a) & b;
    4'd5:
      c = b;
    4'd6:
      c = a ^ b;
    4'd7:
      c = a | b;
    4'd8:
      c = ~(a | b);
    4'd9:
      c = (a & b) | ((~a) & (~b));
    4'd10:
      c = ~b;
    4'd11:
      c = a | (~b);
    4'd12:
      c = ~a;
    4'd13:
      c = (~a) | b;
    4'd14:
      c = ~(a & b);
    4'd15:
      c = 1;
    
    default: begin
      c = 0;
    end
  endcase
end

endmodule

`endif