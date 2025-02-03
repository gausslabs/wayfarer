`ifndef TOFFOLI_SV
  `define TOFFOLI_SV

module Toffoli (
  input wire [3:0] gateChoice,
  input wire a,
  input wire b,
  input wire c,
  output logic target
);

///////////////////////////////////////////////////////////////////////
// This just a combinational implementation of the gate with choice
///////////////////////////////////////////////////////////////////////
logic func;
always_comb 
begin
  case (gateChoice)
    4'd0:
      func = 1;
    4'd1:
      func = a & b;
    4'd2:
      func = a & (~b);
    4'd3:
      func = a;
    4'd4:
      func = (~a) & b;
    4'd5:
      func = b;
    4'd6:
      func = a ^ b;
    4'd7:
      func = a | b;
    4'd8:
      func = ~(a | b);
    4'd9:
      func = (a & b) | ((~a) & (~b));
    4'd10:
      func = ~b;
    4'd11:
      func = a | (~b);
    4'd12:
      func = ~a;
    4'd13:
      func = (~a) | b;
    4'd14:
      func = ~(a & b);
    4'd15:
      func = 0;
    
    default: begin
      func = 1;
    end
  endcase
end

assign target = func ^ c; 

endmodule

`endif