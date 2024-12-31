`ifndef SAFEPERMUTATIONGENERATOR_SV
  `define SAFEPERMUTATIONGENERATOR_SV

module SafePermutationGenerator #(
  parameter PERM_SIZE = 5,
  parameter PORT_SIZE = 2
) (
  input wire [PERM_SIZE - 1:0] selection,
  output logic [PORT_SIZE- 1:0] [2:0] permutation
);

always_comb
begin
case(selection)

  5'd0:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd1;
    
  end

  5'd1:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd2;
    
  end

  5'd2:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd0;
    
  end

  5'd3:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd2;
    
  end

  5'd4:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd0;
    
  end

  5'd5:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd1;
    
  end

  5'd6:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd1;
    
  end

  5'd7:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd3;
    
  end

  5'd8:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd0;
    
  end

  5'd9:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd3;
    
  end

  5'd10:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd0;
    
  end

  5'd11:
  begin
    
    permutation[0] = 2'd2;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd1;
    
  end

  5'd12:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd2;
    
  end

  5'd13:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd3;
    
  end

  5'd14:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd0;
    
  end

  5'd15:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd3;
    
  end

  5'd16:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd0;
    
  end

  5'd17:
  begin
    
    permutation[0] = 2'd1;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd2;
    
  end

  5'd18:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd2;
    
  end

  5'd19:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd1;
    
    permutation[2] = 2'd3;
    
  end

  5'd20:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd1;
    
  end

  5'd21:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd2;
    
    permutation[2] = 2'd3;
    
  end

  5'd22:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd1;
    
  end

  5'd23:
  begin
    
    permutation[0] = 2'd0;
    
    permutation[1] = 2'd3;
    
    permutation[2] = 2'd2;
    
  end

  default:
  begin
    
    permutation[0] = 2'd3;
    
    permutation[1] = 2'd0;
    
    permutation[2] = 2'd1;
    
  end
endcase
end

endmodule


`endif