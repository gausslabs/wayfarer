`ifndef ARBITER
 `define ARBITER

module Arbiter3 (
  input wire clk,
  input wire resetn,
  input wire [2:0] req,
  output logic [2:0] grant
);
///////////////////////////////////////////////////////
// Internal nets
///////////////////////////////////////////////////////
typedef enum logic [1:0] { 
    FIRST,
    SECOND,
    THIRD
} Position;

Position current_position, next_position;

///////////////////////////////////////////////////////
// position contol
///////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
 current_position <= next_position;
end
else
begin
 current_position <= FIRST;
end
end

always_comb 
begin
  case (grant)
    3'b000:
        next_position = FIRST;
    3'b001:
        next_position = SECOND;
    3'b010:
        next_position = THIRD;
    3'b100:
        next_position = FIRST;
    default: 
    begin
        next_position = FIRST;
    end
  endcase
end

///////////////////////////////////////////////////////
// arbitration
///////////////////////////////////////////////////////

always_comb 
begin
  case (current_position)
    FIRST:
        if (req[0]) grant = 3'b001;
        else if (req[1]) grant = 3'b010;
        else if (req[2]) grant = 3'b100;
        else grant = 3'b000;
    SECOND:
        if (req[1]) grant = 3'b010;
        else if (req[2]) grant = 3'b100;
        else if (req[0]) grant = 3'b001;
        else grant = 3'b000;
    THIRD:
        if (req[2]) grant = 3'b100;
        else if (req[0]) grant = 3'b001;
        else if (req[1]) grant = 3'b010;
        else grant = 3'b000;
    default: 
    begin
        grant = 3'b000;
    end
  endcase
end


endmodule


`endif
