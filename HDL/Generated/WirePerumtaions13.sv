`ifndef SAFEPERMUTATIONGENERATOR13_SV
  `define SAFEPERMUTATIONGENERATOR13_SV

`default_nettype none
///////////////////////////////////////////////////////////////////////////////////////
// This is generated code please dont edit this but the emitter
// This is all the safe permuations for a given number of Total wires.
///////////////////////////////////////////////////////////////////////////////////////

module SafePermutationGenerator13 #(
  parameter PERM_SIZE = 11,
  parameter PORT_SIZE = 4
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [2:0] [PORT_SIZE- 1:0] permutation
);

always_comb
begin
case(selection)

  11'd0:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd2:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd3:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd4:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd5:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd6:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd7:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd8:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd9:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd10:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd11:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd12:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd13:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd14:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd15:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd16:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd17:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd18:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd19:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd20:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd21:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd22:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd23:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd24:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd25:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd26:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd27:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd28:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd29:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd30:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd31:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd32:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd33:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd34:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd35:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd36:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd37:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd38:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd39:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd40:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd41:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd42:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd43:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd44:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd45:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd46:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd47:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd48:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd49:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd50:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd51:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd52:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd53:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd54:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd55:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd56:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd57:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd58:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd59:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd60:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd61:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd62:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd63:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd64:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd65:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd66:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd67:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd68:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd69:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd70:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd71:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd72:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd73:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd74:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd75:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd76:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd77:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd78:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd79:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd80:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd81:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd82:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd83:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd84:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd85:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd86:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd87:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd88:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd89:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd90:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd91:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd92:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd93:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd94:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd95:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd96:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd97:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd98:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd99:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd100:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd101:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd102:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd103:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd104:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd105:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd106:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd107:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd108:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd109:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd110:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd111:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd112:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd113:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd114:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd115:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd116:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd117:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd118:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd119:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd120:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd121:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd122:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd123:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd124:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd125:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd126:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd127:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd128:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd129:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd130:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd131:
  begin
    
    permutation[0] = 4'd0;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd132:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd133:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd134:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd135:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd136:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd137:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd138:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd139:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd140:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd141:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd142:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd143:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd144:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd145:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd146:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd147:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd148:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd149:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd150:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd151:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd152:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd153:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd154:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd155:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd156:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd157:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd158:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd159:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd160:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd161:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd162:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd163:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd164:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd165:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd166:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd167:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd168:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd169:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd170:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd171:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd172:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd173:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd174:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd175:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd176:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd177:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd178:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd179:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd180:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd181:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd182:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd183:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd184:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd185:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd186:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd187:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd188:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd189:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd190:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd191:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd192:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd193:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd194:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd195:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd196:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd197:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd198:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd199:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd200:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd201:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd202:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd203:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd204:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd205:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd206:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd207:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd208:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd209:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd210:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd211:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd212:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd213:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd214:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd215:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd216:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd217:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd218:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd219:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd220:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd221:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd222:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd223:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd224:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd225:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd226:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd227:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd228:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd229:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd230:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd231:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd232:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd233:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd234:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd235:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd236:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd237:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd238:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd239:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd240:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd241:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd242:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd243:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd244:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd245:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd246:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd247:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd248:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd249:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd250:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd251:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd252:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd253:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd254:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd255:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd256:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd257:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd258:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd259:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd260:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd261:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd262:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd263:
  begin
    
    permutation[0] = 4'd1;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd264:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd265:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd266:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd267:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd268:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd269:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd270:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd271:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd272:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd273:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd274:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd275:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd276:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd277:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd278:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd279:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd280:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd281:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd282:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd283:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd284:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd285:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd286:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd287:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd288:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd289:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd290:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd291:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd292:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd293:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd294:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd295:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd296:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd297:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd298:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd299:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd300:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd301:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd302:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd303:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd304:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd305:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd306:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd307:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd308:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd309:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd310:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd311:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd312:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd313:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd314:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd315:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd316:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd317:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd318:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd319:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd320:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd321:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd322:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd323:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd324:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd325:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd326:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd327:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd328:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd329:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd330:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd331:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd332:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd333:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd334:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd335:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd336:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd337:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd338:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd339:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd340:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd341:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd342:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd343:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd344:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd345:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd346:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd347:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd348:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd349:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd350:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd351:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd352:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd353:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd354:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd355:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd356:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd357:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd358:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd359:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd360:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd361:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd362:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd363:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd364:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd365:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd366:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd367:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd368:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd369:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd370:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd371:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd372:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd373:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd374:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd375:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd376:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd377:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd378:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd379:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd380:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd381:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd382:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd383:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd384:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd385:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd386:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd387:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd388:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd389:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd390:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd391:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd392:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd393:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd394:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd395:
  begin
    
    permutation[0] = 4'd2;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd396:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd397:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd398:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd399:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd400:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd401:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd402:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd403:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd404:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd405:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd406:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd407:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd408:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd409:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd410:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd411:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd412:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd413:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd414:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd415:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd416:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd417:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd418:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd419:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd420:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd421:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd422:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd423:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd424:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd425:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd426:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd427:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd428:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd429:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd430:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd431:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd432:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd433:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd434:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd435:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd436:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd437:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd438:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd439:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd440:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd441:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd442:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd443:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd444:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd445:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd446:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd447:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd448:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd449:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd450:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd451:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd452:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd453:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd454:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd455:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd456:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd457:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd458:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd459:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd460:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd461:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd462:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd463:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd464:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd465:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd466:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd467:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd468:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd469:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd470:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd471:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd472:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd473:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd474:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd475:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd476:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd477:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd478:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd479:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd480:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd481:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd482:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd483:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd484:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd485:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd486:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd487:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd488:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd489:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd490:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd491:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd492:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd493:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd494:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd495:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd496:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd497:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd498:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd499:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd500:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd501:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd502:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd503:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd504:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd505:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd506:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd507:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd508:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd509:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd510:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd511:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd512:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd513:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd514:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd515:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd516:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd517:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd518:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd519:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd520:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd521:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd522:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd523:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd524:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd525:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd526:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd527:
  begin
    
    permutation[0] = 4'd3;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd528:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd529:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd530:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd531:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd532:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd533:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd534:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd535:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd536:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd537:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd538:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd539:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd540:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd541:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd542:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd543:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd544:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd545:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd546:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd547:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd548:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd549:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd550:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd551:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd552:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd553:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd554:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd555:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd556:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd557:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd558:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd559:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd560:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd561:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd562:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd563:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd564:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd565:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd566:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd567:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd568:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd569:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd570:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd571:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd572:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd573:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd574:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd575:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd576:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd577:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd578:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd579:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd580:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd581:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd582:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd583:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd584:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd585:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd586:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd587:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd588:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd589:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd590:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd591:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd592:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd593:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd594:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd595:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd596:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd597:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd598:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd599:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd600:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd601:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd602:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd603:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd604:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd605:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd606:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd607:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd608:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd609:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd610:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd611:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd612:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd613:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd614:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd615:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd616:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd617:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd618:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd619:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd620:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd621:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd622:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd623:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd624:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd625:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd626:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd627:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd628:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd629:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd630:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd631:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd632:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd633:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd634:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd635:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd636:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd637:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd638:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd639:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd640:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd641:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd642:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd643:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd644:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd645:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd646:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd647:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd648:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd649:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd650:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd651:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd652:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd653:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd654:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd655:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd656:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd657:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd658:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd659:
  begin
    
    permutation[0] = 4'd4;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd660:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd661:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd662:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd663:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd664:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd665:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd666:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd667:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd668:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd669:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd670:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd671:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd672:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd673:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd674:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd675:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd676:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd677:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd678:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd679:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd680:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd681:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd682:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd683:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd684:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd685:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd686:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd687:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd688:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd689:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd690:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd691:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd692:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd693:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd694:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd695:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd696:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd697:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd698:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd699:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd700:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd701:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd702:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd703:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd704:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd705:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd706:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd707:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd708:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd709:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd710:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd711:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd712:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd713:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd714:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd715:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd716:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd717:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd718:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd719:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd720:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd721:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd722:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd723:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd724:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd725:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd726:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd727:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd728:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd729:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd730:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd731:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd732:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd733:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd734:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd735:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd736:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd737:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd738:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd739:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd740:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd741:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd742:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd743:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd744:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd745:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd746:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd747:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd748:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd749:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd750:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd751:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd752:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd753:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd754:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd755:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd756:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd757:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd758:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd759:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd760:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd761:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd762:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd763:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd764:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd765:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd766:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd767:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd768:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd769:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd770:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd771:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd772:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd773:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd774:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd775:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd776:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd777:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd778:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd779:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd780:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd781:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd782:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd783:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd784:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd785:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd786:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd787:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd788:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd789:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd790:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd791:
  begin
    
    permutation[0] = 4'd5;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd792:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd793:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd794:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd795:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd796:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd797:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd798:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd799:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd800:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd801:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd802:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd803:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd804:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd805:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd806:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd807:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd808:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd809:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd810:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd811:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd812:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd813:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd814:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd815:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd816:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd817:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd818:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd819:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd820:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd821:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd822:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd823:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd824:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd825:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd826:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd827:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd828:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd829:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd830:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd831:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd832:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd833:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd834:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd835:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd836:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd837:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd838:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd839:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd840:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd841:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd842:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd843:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd844:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd845:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd846:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd847:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd848:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd849:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd850:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd851:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd852:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd853:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd854:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd855:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd856:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd857:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd858:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd859:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd860:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd861:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd862:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd863:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd864:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd865:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd866:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd867:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd868:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd869:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd870:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd871:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd872:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd873:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd874:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd875:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd876:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd877:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd878:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd879:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd880:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd881:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd882:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd883:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd884:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd885:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd886:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd887:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd888:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd889:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd890:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd891:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd892:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd893:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd894:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd895:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd896:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd897:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd898:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd899:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd900:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd901:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd902:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd903:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd904:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd905:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd906:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd907:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd908:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd909:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd910:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd911:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd912:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd913:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd914:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd915:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd916:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd917:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd918:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd919:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd920:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd921:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd922:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd923:
  begin
    
    permutation[0] = 4'd6;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd924:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd925:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd926:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd927:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd928:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd929:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd930:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd931:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd932:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd933:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd934:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd935:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd936:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd937:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd938:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd939:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd940:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd941:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd942:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd943:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd944:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd945:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd946:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd947:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd948:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd949:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd950:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd951:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd952:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd953:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd954:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd955:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd956:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd957:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd958:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd959:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd960:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd961:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd962:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd963:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd964:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd965:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd966:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd967:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd968:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd969:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd970:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd971:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd972:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd973:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd974:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd975:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd976:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd977:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd978:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd979:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd980:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd981:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd982:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd983:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd984:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd985:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd986:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd987:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd988:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd989:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd990:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd991:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd992:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd993:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd994:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd995:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd996:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd997:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd998:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd999:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd1000:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd1001:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd1002:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd1003:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd1004:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd1005:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd1006:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd1007:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd1008:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd1009:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd1010:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd1011:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd1012:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd1013:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd1014:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd1015:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd1016:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd1017:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd1018:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd1019:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd1020:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd1021:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd1022:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd1023:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd1024:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd1025:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd1026:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd1027:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd1028:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd1029:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd1030:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd1031:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd1032:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd1033:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd1034:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd1035:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd1036:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd1037:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd1038:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd1039:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd1040:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd1041:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd1042:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd1043:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd1044:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd1045:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd1046:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd1047:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd1048:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd1049:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd1050:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd1051:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd1052:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd1053:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd1054:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd1055:
  begin
    
    permutation[0] = 4'd7;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd1056:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd1057:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd1058:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd1059:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd1060:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd1061:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd1062:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd1063:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd1064:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd1065:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd1066:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd1067:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd1068:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1069:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd1070:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd1071:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd1072:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd1073:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd1074:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd1075:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd1076:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd1077:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd1078:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd1079:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd1080:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd1081:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd1082:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd1083:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd1084:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd1085:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd1086:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd1087:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd1088:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd1089:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd1090:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd1091:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd1092:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd1093:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd1094:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd1095:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd1096:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd1097:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd1098:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd1099:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd1100:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd1101:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd1102:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd1103:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd1104:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd1105:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd1106:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd1107:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd1108:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd1109:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd1110:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd1111:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd1112:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd1113:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd1114:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd1115:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd1116:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd1117:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd1118:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd1119:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd1120:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd1121:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd1122:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd1123:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd1124:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd1125:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd1126:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd1127:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd1128:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd1129:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd1130:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd1131:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd1132:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd1133:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd1134:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd1135:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd1136:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd1137:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd1138:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd1139:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd1140:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd1141:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd1142:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd1143:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd1144:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd1145:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd1146:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd1147:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd1148:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd1149:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd1150:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd1151:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd1152:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd1153:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd1154:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd1155:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd1156:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd1157:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd1158:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd1159:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd1160:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd1161:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd1162:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd1163:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd1164:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd1165:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd1166:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd1167:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd1168:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd1169:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd1170:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd1171:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd1172:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd1173:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd1174:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd1175:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd1176:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd1177:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd1178:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd1179:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd1180:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd1181:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd1182:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd1183:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd1184:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd1185:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd1186:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd1187:
  begin
    
    permutation[0] = 4'd8;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd1188:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd1189:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd1190:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd1191:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd1192:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd1193:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd1194:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd1195:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd1196:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd1197:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd1198:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd1199:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd1200:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1201:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd1202:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd1203:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd1204:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd1205:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd1206:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd1207:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd1208:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd1209:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd1210:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd1211:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd1212:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd1213:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd1214:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd1215:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd1216:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd1217:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd1218:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd1219:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd1220:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd1221:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd1222:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd1223:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd1224:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd1225:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd1226:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd1227:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd1228:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd1229:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd1230:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd1231:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd1232:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd1233:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd1234:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd1235:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd1236:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd1237:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd1238:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd1239:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd1240:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd1241:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd1242:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd1243:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd1244:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd1245:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd1246:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd1247:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd1248:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd1249:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd1250:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd1251:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd1252:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd1253:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd1254:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd1255:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd1256:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd1257:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd1258:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd1259:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd1260:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd1261:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd1262:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd1263:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd1264:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd1265:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd1266:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd1267:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd1268:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd1269:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd1270:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd1271:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd1272:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd1273:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd1274:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd1275:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd1276:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd1277:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd1278:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd1279:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd1280:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd1281:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd1282:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd1283:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd1284:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd1285:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd1286:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd1287:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd1288:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd1289:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd1290:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd1291:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd1292:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd1293:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd1294:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd1295:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd1296:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd1297:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd1298:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd1299:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd1300:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd1301:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd1302:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd1303:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd1304:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd1305:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd1306:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd1307:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
  end

  11'd1308:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd1309:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd1310:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd1311:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd1312:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd1313:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd1314:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd1315:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd1316:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd1317:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd1318:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd1319:
  begin
    
    permutation[0] = 4'd9;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd1320:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd1321:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd1322:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd1323:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd1324:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd1325:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd1326:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd1327:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd1328:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd1329:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd1330:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd1331:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd1332:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1333:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd1334:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd1335:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd1336:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd1337:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd1338:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd1339:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd1340:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd1341:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd1342:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd1343:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd1344:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd1345:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd1346:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd1347:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd1348:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd1349:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd1350:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd1351:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd1352:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd1353:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd1354:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd1355:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd1356:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd1357:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd1358:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd1359:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd1360:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd1361:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd1362:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd1363:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd1364:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd1365:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd1366:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd1367:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd1368:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd1369:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd1370:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd1371:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd1372:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd1373:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd1374:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd1375:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd1376:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd1377:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd1378:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd1379:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd1380:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd1381:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd1382:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd1383:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd1384:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd1385:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd1386:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd1387:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd1388:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd1389:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd1390:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd1391:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd1392:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd1393:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd1394:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd1395:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd1396:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd1397:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd1398:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd1399:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd1400:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd1401:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd1402:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd1403:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd1404:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd1405:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd1406:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd1407:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd1408:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd1409:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd1410:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd1411:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd1412:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd1413:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd1414:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd1415:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd1416:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd1417:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd1418:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd1419:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd1420:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd1421:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd1422:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd1423:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd1424:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd1425:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd1426:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd1427:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd1428:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd1429:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd1430:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd1431:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd1432:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd1433:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd1434:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd1435:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd1436:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd1437:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd1438:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd1439:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd1440:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd12;
    
  end

  11'd1441:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd1442:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd1443:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd1444:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd1445:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd1446:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd1447:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd1448:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd1449:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd1450:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd1451:
  begin
    
    permutation[0] = 4'd10;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd11;
    
  end

  11'd1452:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd1453:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd1454:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd1455:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd1456:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd1457:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd1458:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd1459:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd1460:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd1461:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd1462:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd12;
    
  end

  11'd1463:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd1464:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1465:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd1466:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd1467:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd1468:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd1469:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd1470:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd1471:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd1472:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd1473:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd12;
    
  end

  11'd1474:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd1475:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd1476:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd1477:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd1478:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd1479:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd1480:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd1481:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd1482:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd1483:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd1484:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd12;
    
  end

  11'd1485:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd1486:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd1487:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd1488:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd1489:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd1490:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd1491:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd1492:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd1493:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd1494:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd1495:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd12;
    
  end

  11'd1496:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd1497:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd1498:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd1499:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd1500:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd1501:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd1502:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd1503:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd1504:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd1505:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd1506:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd12;
    
  end

  11'd1507:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd1508:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd1509:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd1510:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd1511:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd1512:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd1513:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd1514:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd1515:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd1516:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd1517:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd12;
    
  end

  11'd1518:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd1519:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd1520:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd1521:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd1522:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd1523:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd1524:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd1525:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd1526:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd1527:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd1528:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd12;
    
  end

  11'd1529:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd1530:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd1531:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd1532:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd1533:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd1534:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd1535:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd1536:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd1537:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd1538:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd1539:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd12;
    
  end

  11'd1540:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd1541:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd1542:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd1543:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd1544:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd1545:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd1546:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd1547:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd1548:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd1549:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd1550:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd12;
    
  end

  11'd1551:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd1552:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd1553:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd1554:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd1555:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd1556:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd1557:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd1558:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd1559:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd1560:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd1561:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd12;
    
  end

  11'd1562:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd1563:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd1564:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd1565:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd1566:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd1567:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd1568:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd1569:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd1570:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd1571:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd1572:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd12;
    
  end

  11'd1573:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd0;
    
  end

  11'd1574:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd1;
    
  end

  11'd1575:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd2;
    
  end

  11'd1576:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd3;
    
  end

  11'd1577:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd4;
    
  end

  11'd1578:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd5;
    
  end

  11'd1579:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd6;
    
  end

  11'd1580:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd7;
    
  end

  11'd1581:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd8;
    
  end

  11'd1582:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd9;
    
  end

  11'd1583:
  begin
    
    permutation[0] = 4'd11;
    
    permutation[1] = 4'd12;
    
    permutation[2] = 4'd10;
    
  end

  11'd1584:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd1;
    
  end

  11'd1585:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd2;
    
  end

  11'd1586:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd3;
    
  end

  11'd1587:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd4;
    
  end

  11'd1588:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd5;
    
  end

  11'd1589:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd6;
    
  end

  11'd1590:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd7;
    
  end

  11'd1591:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd8;
    
  end

  11'd1592:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd9;
    
  end

  11'd1593:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd10;
    
  end

  11'd1594:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd0;
    
    permutation[2] = 4'd11;
    
  end

  11'd1595:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd0;
    
  end

  11'd1596:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd2;
    
  end

  11'd1597:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd3;
    
  end

  11'd1598:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd4;
    
  end

  11'd1599:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd5;
    
  end

  11'd1600:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd6;
    
  end

  11'd1601:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd7;
    
  end

  11'd1602:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd8;
    
  end

  11'd1603:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd9;
    
  end

  11'd1604:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd10;
    
  end

  11'd1605:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd1;
    
    permutation[2] = 4'd11;
    
  end

  11'd1606:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd0;
    
  end

  11'd1607:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd1;
    
  end

  11'd1608:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd3;
    
  end

  11'd1609:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd4;
    
  end

  11'd1610:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd5;
    
  end

  11'd1611:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd6;
    
  end

  11'd1612:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd7;
    
  end

  11'd1613:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd8;
    
  end

  11'd1614:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd9;
    
  end

  11'd1615:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd10;
    
  end

  11'd1616:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd2;
    
    permutation[2] = 4'd11;
    
  end

  11'd1617:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd0;
    
  end

  11'd1618:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd1;
    
  end

  11'd1619:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd2;
    
  end

  11'd1620:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd4;
    
  end

  11'd1621:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd5;
    
  end

  11'd1622:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd6;
    
  end

  11'd1623:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd7;
    
  end

  11'd1624:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd8;
    
  end

  11'd1625:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd9;
    
  end

  11'd1626:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd10;
    
  end

  11'd1627:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd3;
    
    permutation[2] = 4'd11;
    
  end

  11'd1628:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd0;
    
  end

  11'd1629:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd1;
    
  end

  11'd1630:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd2;
    
  end

  11'd1631:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd3;
    
  end

  11'd1632:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd5;
    
  end

  11'd1633:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd6;
    
  end

  11'd1634:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd7;
    
  end

  11'd1635:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd8;
    
  end

  11'd1636:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd9;
    
  end

  11'd1637:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd10;
    
  end

  11'd1638:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd4;
    
    permutation[2] = 4'd11;
    
  end

  11'd1639:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd0;
    
  end

  11'd1640:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd1;
    
  end

  11'd1641:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd2;
    
  end

  11'd1642:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd3;
    
  end

  11'd1643:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd4;
    
  end

  11'd1644:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd6;
    
  end

  11'd1645:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd7;
    
  end

  11'd1646:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd8;
    
  end

  11'd1647:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd9;
    
  end

  11'd1648:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd10;
    
  end

  11'd1649:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd5;
    
    permutation[2] = 4'd11;
    
  end

  11'd1650:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd0;
    
  end

  11'd1651:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd1;
    
  end

  11'd1652:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd2;
    
  end

  11'd1653:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd3;
    
  end

  11'd1654:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd4;
    
  end

  11'd1655:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd5;
    
  end

  11'd1656:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd7;
    
  end

  11'd1657:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd8;
    
  end

  11'd1658:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd9;
    
  end

  11'd1659:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd10;
    
  end

  11'd1660:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd6;
    
    permutation[2] = 4'd11;
    
  end

  11'd1661:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd0;
    
  end

  11'd1662:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd1;
    
  end

  11'd1663:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd2;
    
  end

  11'd1664:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd3;
    
  end

  11'd1665:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd4;
    
  end

  11'd1666:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd5;
    
  end

  11'd1667:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd6;
    
  end

  11'd1668:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd8;
    
  end

  11'd1669:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd9;
    
  end

  11'd1670:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd10;
    
  end

  11'd1671:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd7;
    
    permutation[2] = 4'd11;
    
  end

  11'd1672:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd0;
    
  end

  11'd1673:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd1;
    
  end

  11'd1674:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd2;
    
  end

  11'd1675:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd3;
    
  end

  11'd1676:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd4;
    
  end

  11'd1677:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd5;
    
  end

  11'd1678:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd6;
    
  end

  11'd1679:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd7;
    
  end

  11'd1680:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd9;
    
  end

  11'd1681:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd10;
    
  end

  11'd1682:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd8;
    
    permutation[2] = 4'd11;
    
  end

  11'd1683:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd0;
    
  end

  11'd1684:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd1;
    
  end

  11'd1685:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd2;
    
  end

  11'd1686:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd3;
    
  end

  11'd1687:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd4;
    
  end

  11'd1688:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd5;
    
  end

  11'd1689:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd6;
    
  end

  11'd1690:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd7;
    
  end

  11'd1691:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd8;
    
  end

  11'd1692:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd10;
    
  end

  11'd1693:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd9;
    
    permutation[2] = 4'd11;
    
  end

  11'd1694:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd0;
    
  end

  11'd1695:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd1;
    
  end

  11'd1696:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd2;
    
  end

  11'd1697:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd3;
    
  end

  11'd1698:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd4;
    
  end

  11'd1699:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd5;
    
  end

  11'd1700:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd6;
    
  end

  11'd1701:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd7;
    
  end

  11'd1702:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd8;
    
  end

  11'd1703:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd9;
    
  end

  11'd1704:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd10;
    
    permutation[2] = 4'd11;
    
  end

  11'd1705:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd0;
    
  end

  11'd1706:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd1;
    
  end

  11'd1707:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd2;
    
  end

  11'd1708:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd3;
    
  end

  11'd1709:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd4;
    
  end

  11'd1710:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd5;
    
  end

  11'd1711:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd6;
    
  end

  11'd1712:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd7;
    
  end

  11'd1713:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd8;
    
  end

  11'd1714:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd9;
    
  end

  11'd1715:
  begin
    
    permutation[0] = 4'd12;
    
    permutation[1] = 4'd11;
    
    permutation[2] = 4'd10;
    
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