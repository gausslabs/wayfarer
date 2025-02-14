`ifndef SAFEPERMUTATIONGENERATOR11_SV
  `define SAFEPERMUTATIONGENERATOR11_SV

`default_nettype none
///////////////////////////////////////////////////////////////////////////////////////
// This is generated code please dont edit this but the emitter
// This is all the safe permuations for a given number of Total wires.
///////////////////////////////////////////////////////////////////////////////////////

module SafePermutationGenerator11 #(
  parameter PERM_SIZE = 10,
  parameter PORT_SIZE = 4
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [PORT_SIZE- 1:0] [2:0] permutation
);

always_comb
begin
case(selection)

  10'd0:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd1:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd2:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd3:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd4:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd5:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd6:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd7:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd8:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd9:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd10:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd11:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd12:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd13:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd14:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd15:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd16:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd17:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd18:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd19:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd20:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd21:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd22:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd23:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd24:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd25:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd26:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd27:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd28:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd29:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd30:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd31:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd32:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd33:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd34:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd35:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd36:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd37:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd38:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd39:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd40:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd41:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd42:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd43:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd44:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd45:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd46:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd47:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd48:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd49:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd50:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd51:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd52:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd53:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd54:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd55:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd56:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd57:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd58:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd59:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd60:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd61:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd62:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd63:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd64:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd65:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd66:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd67:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd68:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd69:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd70:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd71:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd72:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd73:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd74:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd75:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd76:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd77:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd78:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd79:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd80:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd81:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd82:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd83:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd84:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd85:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd86:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd87:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd88:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd89:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd90:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd91:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd92:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd93:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd94:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd95:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd96:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd97:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd98:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd99:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd100:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd101:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd102:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd103:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd104:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd105:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd106:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd107:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd108:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd109:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd110:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd111:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd112:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd113:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd114:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd115:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd116:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd117:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd118:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd119:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd120:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd121:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd122:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd123:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd124:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd125:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd126:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd127:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd128:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd129:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd130:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd131:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd132:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd133:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd134:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd135:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd136:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd137:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd138:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd139:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd140:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd141:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd142:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd143:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd144:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd145:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd146:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd147:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd148:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd149:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd150:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd151:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd152:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd153:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd154:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd155:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd156:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd157:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd158:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd159:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd160:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd161:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd162:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd163:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd164:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd165:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd166:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd167:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd168:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd169:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd170:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd171:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd172:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd173:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd174:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd175:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd176:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd177:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd178:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd179:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd180:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd181:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd182:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd183:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd184:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd185:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd186:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd187:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd188:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd189:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd190:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd191:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd192:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd193:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd194:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd195:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd196:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd197:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd198:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd199:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd200:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd201:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd202:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd203:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd204:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd205:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd206:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd207:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd208:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd209:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd210:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd211:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd212:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd213:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd214:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd215:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd216:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd217:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd218:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd219:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd220:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd221:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd222:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd223:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd224:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd225:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd226:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd227:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd228:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd229:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd230:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd231:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd232:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd233:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd234:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd235:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd236:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd237:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd238:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd239:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd240:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd241:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd242:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd243:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd244:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd245:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd246:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd247:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd248:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd249:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd250:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd251:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd252:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd253:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd254:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd255:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd256:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd257:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd258:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd259:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd260:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd261:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd262:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd263:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd264:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd265:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd266:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd267:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd268:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd269:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd270:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd271:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd272:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd273:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd274:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd275:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd276:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd277:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd278:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd279:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd280:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd281:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd282:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd283:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd284:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd285:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd286:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd287:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd288:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd289:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd290:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd291:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd292:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd293:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd294:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd295:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd296:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd297:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd298:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd299:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd300:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd301:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd302:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd303:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd304:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd305:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd306:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd307:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd308:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd309:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd310:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd311:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd312:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd313:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd314:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd315:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd316:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd317:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd318:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd319:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd320:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd321:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd322:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd323:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd324:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd325:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd326:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd327:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd328:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd329:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd330:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd331:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd332:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd333:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd334:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd335:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd336:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd337:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd338:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd339:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd340:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd341:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd342:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd343:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd344:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd345:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd346:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd347:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd348:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd349:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd350:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd351:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd352:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd353:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd354:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd355:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd356:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd357:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd358:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd359:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd360:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd361:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd362:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd363:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd364:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd365:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd366:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd367:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd368:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd369:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd370:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd371:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd372:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd373:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd374:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd375:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd376:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd377:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd378:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd379:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd380:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd381:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd382:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd383:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd384:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd385:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd386:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd387:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd388:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd389:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd390:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd391:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd392:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd393:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd394:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd395:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd396:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd397:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd398:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd399:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd400:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd401:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd402:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd403:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd404:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd405:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd406:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd407:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd408:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd409:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd410:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd411:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd412:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd413:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd414:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd415:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd416:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd417:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd418:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd419:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd420:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd421:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd422:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd423:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd424:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd425:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd426:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd427:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd428:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd429:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd430:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd431:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd432:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd433:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd434:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd435:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd436:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd437:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd438:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd439:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd440:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd441:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd442:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd443:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd444:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd445:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd446:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd447:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd448:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd449:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd450:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd451:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd452:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd453:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd454:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd455:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd456:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd457:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd458:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd459:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd460:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd461:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd462:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd463:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd464:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd465:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd466:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd467:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd468:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd469:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd470:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd471:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd472:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd473:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd474:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd475:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd476:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd477:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd478:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd479:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd480:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd481:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd482:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd483:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd484:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd485:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd486:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd487:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd488:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd489:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd490:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd491:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd492:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd493:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd494:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd495:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd496:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd497:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd498:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd499:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd500:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd501:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd502:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd503:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd504:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd505:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd506:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd507:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd508:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd509:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd510:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd511:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd512:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd513:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd514:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd515:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd516:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd517:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd518:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd519:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd520:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd521:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd522:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd523:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd524:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd525:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd526:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd527:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd528:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd529:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd530:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd531:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd532:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd533:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd534:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd535:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd536:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd537:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd538:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd539:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd540:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd541:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd542:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd543:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd544:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd545:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd546:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd547:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd548:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd549:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd550:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd551:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd552:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd553:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd554:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd555:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd556:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd557:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd558:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd559:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd560:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd561:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd562:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd563:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd564:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd565:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd566:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd567:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd568:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd569:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd570:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd571:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd572:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd573:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd574:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd575:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd576:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd577:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd578:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd579:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd580:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd581:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd582:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd583:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd584:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd585:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd586:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd587:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd588:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd589:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd590:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd591:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd592:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd593:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd594:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd595:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd596:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd597:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd598:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd599:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd600:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd601:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd602:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd603:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd604:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd605:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd606:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd607:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd608:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd609:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd610:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd611:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd612:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd613:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd614:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd615:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd616:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd617:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd618:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd619:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd620:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd621:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd622:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd623:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd624:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd625:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd626:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd627:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd628:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd629:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd630:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd631:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd632:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd633:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd634:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd635:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd636:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd637:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd638:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd639:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd640:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd641:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd642:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd643:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd644:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd645:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd646:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd647:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd648:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd649:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd650:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd651:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd652:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd653:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd654:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd655:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd656:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd657:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd658:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd659:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd660:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd661:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd662:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd663:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd664:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd665:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd666:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd667:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd668:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd669:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd670:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd671:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd672:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd673:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd674:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd675:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd676:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd677:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd678:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd679:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd680:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd681:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd682:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd683:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd684:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd685:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd686:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd687:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd688:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd689:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd690:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd691:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd692:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd693:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd694:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd695:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd696:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd697:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd698:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd699:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd700:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd701:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd702:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd703:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd704:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd705:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd706:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd707:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd708:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd709:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  10'd710:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd711:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd712:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd713:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd714:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd715:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd716:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd717:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd718:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd719:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd720:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd721:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd722:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd723:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd724:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd725:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd726:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd727:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd728:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd729:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd730:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd731:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd732:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd733:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd734:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd735:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd736:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd737:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd738:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd739:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd740:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd741:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd742:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd743:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd744:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd745:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd746:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd747:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd748:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd749:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd750:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd751:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd752:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd753:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd754:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd755:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd756:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd757:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd758:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd759:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd760:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd761:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd762:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd763:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd764:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd765:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd766:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd767:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd768:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd769:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd770:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd771:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd772:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd773:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd774:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd775:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd776:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd777:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd778:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd779:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd780:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd781:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd782:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd783:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd784:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd785:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd786:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd787:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd788:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd789:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd790:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd791:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd792:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd793:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd794:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd795:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd796:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd797:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd798:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd799:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd800:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  10'd801:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd802:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd803:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd804:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd805:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd806:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd807:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd808:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd809:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  10'd810:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd811:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd812:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd813:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd814:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd815:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd816:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd817:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd818:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  10'd819:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd820:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd821:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd822:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd823:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd824:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd825:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd826:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd827:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  10'd828:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd829:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd830:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd831:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd832:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd833:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd834:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd835:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd836:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  10'd837:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd838:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd839:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd840:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd841:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd842:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd843:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd844:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd845:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  10'd846:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd847:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd848:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd849:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd850:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd851:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd852:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd853:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd854:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  10'd855:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd856:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd857:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd858:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd859:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd860:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd861:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd862:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd863:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  10'd864:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd865:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd866:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd867:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd868:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd869:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd870:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd871:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd872:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  10'd873:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd874:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd875:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd876:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd877:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd878:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd879:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd880:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd881:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  10'd882:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd883:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd884:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd885:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd886:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd887:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd888:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd889:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd890:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  10'd891:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  10'd892:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  10'd893:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  10'd894:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  10'd895:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  10'd896:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  10'd897:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  10'd898:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  10'd899:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  10'd900:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  10'd901:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  10'd902:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  10'd903:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  10'd904:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  10'd905:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  10'd906:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  10'd907:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  10'd908:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  10'd909:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  10'd910:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  10'd911:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  10'd912:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  10'd913:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  10'd914:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  10'd915:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  10'd916:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  10'd917:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  10'd918:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  10'd919:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  10'd920:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  10'd921:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  10'd922:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  10'd923:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  10'd924:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  10'd925:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  10'd926:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  10'd927:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  10'd928:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  10'd929:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  10'd930:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  10'd931:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  10'd932:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  10'd933:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  10'd934:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  10'd935:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  10'd936:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  10'd937:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  10'd938:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  10'd939:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  10'd940:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  10'd941:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  10'd942:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  10'd943:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  10'd944:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  10'd945:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  10'd946:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  10'd947:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  10'd948:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  10'd949:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  10'd950:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  10'd951:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  10'd952:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  10'd953:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  10'd954:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  10'd955:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  10'd956:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  10'd957:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  10'd958:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  10'd959:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  10'd960:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  10'd961:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  10'd962:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  10'd963:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  10'd964:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  10'd965:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  10'd966:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  10'd967:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  10'd968:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  10'd969:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  10'd970:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  10'd971:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  10'd972:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  10'd973:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  10'd974:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  10'd975:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  10'd976:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  10'd977:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  10'd978:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  10'd979:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  10'd980:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  10'd981:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  10'd982:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  10'd983:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  10'd984:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  10'd985:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  10'd986:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  10'd987:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  10'd988:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  10'd989:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  default:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end
endcase
end

endmodule


`endif