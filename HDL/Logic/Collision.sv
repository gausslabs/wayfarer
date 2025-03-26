`ifndef COLLISION_CHECK
 `define COLLISION_CHECK

module RowCollisionCheck (
  input ShufflePkg::ActiveWire target,
  input ShufflePkg::ActiveWire control_1,
  input ShufflePkg::ActiveWire control_2,
  output logic collisionDetected
);

logic collision_target, collision_control_1, collision_control_2;

assign collision_target = ShufflePkg::collision(target, control_1, control_2);
assign collision_control_1 = ShufflePkg::collision(control_1, control_2, target);
assign collision_control_2 = ShufflePkg::collision(control_2, target, control_1);

assign collisionDetected = collision_target | collision_control_1 | collision_control_2;

endmodule

module CollisionCheck (
  input wire clk,
  input wire resetn,
  input ShufflePkg::Targets targets,
  input ShufflePkg::Controls controls,
  output logic collision
);
///////////////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////////////
localparam NUMBER_OF_COLUMNS = ShufflePkg::NUMBER_OF_COLUMNS;
logic [NUMBER_OF_COLUMNS - 1:0] collisionDetected;

///////////////////////////////////////////////////////////////////////////
// output
///////////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
 collision <= |collisionDetected;
end
else
begin
 collision <= 0;
end
end

///////////////////////////////////////////////////////////////////////////
// processing
///////////////////////////////////////////////////////////////////////////
genvar i;
for (i=0; i<NUMBER_OF_COLUMNS; i++) 
begin

RowCollisionCheck row_check (
  .target(targets[i]),
  .control_1(controls[0][i]),
  .control_2(controls[1][i]),
  .collisionDetected(collisionDetected[i])
);
    
end

endmodule

`endif