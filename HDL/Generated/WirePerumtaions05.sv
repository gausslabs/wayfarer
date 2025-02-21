`ifndef SAFEPERMUTATIONGENERATOR5_SV
  `define SAFEPERMUTATIONGENERATOR5_SV

`default_nettype none
///////////////////////////////////////////////////////////////////////////////////////
// This is generated code please dont edit this but the emitter
// This is all the safe permuations for a given number of Total wires.
///////////////////////////////////////////////////////////////////////////////////////

module SafePermutationGenerator5 #(
  parameter PERM_SIZE = 6,
  parameter PORT_SIZE = 3
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [2:0] [PORT_SIZE- 1:0] permutation
);

always_comb
begin
case(selection)

  6'd0:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd2;
    
  end

  6'd1:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd3;
    
  end

  6'd2:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd4;
    
  end

  6'd3:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd1;
    
  end

  6'd4:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd3;
    
  end

  6'd5:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd4;
    
  end

  6'd6:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd1;
    
  end

  6'd7:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd2;
    
  end

  6'd8:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd4;
    
  end

  6'd9:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd1;
    
  end

  6'd10:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd2;
    
  end

  6'd11:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd3;
    
  end

  6'd12:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd2;
    
  end

  6'd13:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd3;
    
  end

  6'd14:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd4;
    
  end

  6'd15:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd0;
    
  end

  6'd16:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd3;
    
  end

  6'd17:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd4;
    
  end

  6'd18:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd0;
    
  end

  6'd19:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd2;
    
  end

  6'd20:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd4;
    
  end

  6'd21:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd0;
    
  end

  6'd22:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd2;
    
  end

  6'd23:
  begin
    
    permutation[0] = 3'd1;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd3;
    
  end

  6'd24:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd1;
    
  end

  6'd25:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd3;
    
  end

  6'd26:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd4;
    
  end

  6'd27:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd0;
    
  end

  6'd28:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd3;
    
  end

  6'd29:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd4;
    
  end

  6'd30:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd0;
    
  end

  6'd31:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd1;
    
  end

  6'd32:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd4;
    
  end

  6'd33:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd0;
    
  end

  6'd34:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd1;
    
  end

  6'd35:
  begin
    
    permutation[0] = 3'd2;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd3;
    
  end

  6'd36:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd1;
    
  end

  6'd37:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd2;
    
  end

  6'd38:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd4;
    
  end

  6'd39:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd0;
    
  end

  6'd40:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd2;
    
  end

  6'd41:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd4;
    
  end

  6'd42:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd0;
    
  end

  6'd43:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd1;
    
  end

  6'd44:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd4;
    
  end

  6'd45:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd0;
    
  end

  6'd46:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd1;
    
  end

  6'd47:
  begin
    
    permutation[0] = 3'd3;
    
    permutation[1] = 3'd4;
    
    permutation[2] = 3'd2;
    
  end

  6'd48:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd1;
    
  end

  6'd49:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd2;
    
  end

  6'd50:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd0;
    
    permutation[2] = 3'd3;
    
  end

  6'd51:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd0;
    
  end

  6'd52:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd2;
    
  end

  6'd53:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd3;
    
  end

  6'd54:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd0;
    
  end

  6'd55:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd1;
    
  end

  6'd56:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd2;
    
    permutation[2] = 3'd3;
    
  end

  6'd57:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd0;
    
  end

  6'd58:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd1;
    
  end

  6'd59:
  begin
    
    permutation[0] = 3'd4;
    
    permutation[1] = 3'd3;
    
    permutation[2] = 3'd2;
    
  end

  default:
  begin
    
    permutation[0] = 3'd0;
    
    permutation[1] = 3'd1;
    
    permutation[2] = 3'd2;
    
  end
endcase
end

endmodule


`endif