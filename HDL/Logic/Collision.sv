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

module CollisionCheck #(
  parameter NUMBER_OF_COLUMNS = ShufflePkg::NUMBER_OF_COLUMNS
) (
  input wire clk,
  input wire resetn,
  input ShufflePkg::Targets targets,
  input ShufflePkg::Controls controls,
  output logic collision
);
///////////////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////////////

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

endmodule : CollisionCheck

module StreamCollisionCheck #(
  parameter NUMBER_OF_COLUMNS = ShufflePkg::NUMBER_OF_COLUMNS
) (
  input wire clk,
  input wire resetn,
  AXI4S.Slave targets,
  AXI4S.Slave controls,
  AXI4S.Master wires,
  output logic collision
);
///////////////////////////////////////////////////////////////////////////
// internal nets
///////////////////////////////////////////////////////////////////////////
ShufflePkg::Targets target_values;
ShufflePkg::ControlData control_data;
ShufflePkg::WireData wire_data;
ShufflePkg::Controls control_values;
logic collisionDetected;

///////////////////////////////////////////////////////////////////////////
// output
///////////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
 collision <= collisionDetected & targets.valid & controls.valid & wires.ready;
end
else
begin
 collision <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (wires.ready)
  begin
    wires.data <= wire_data;  
    wires.valid <= targets.valid & controls.valid;
  end
end
else
begin
  wires.data <= 0;  
  wires.valid <= 0;
end
end


///////////////////////////////////////////////////////////////////////
// Data management
///////////////////////////////////////////////////////////////////////

`PACKED_TO_UNPACKED_CONVERTER(targets.data, target_values.row, NUMBER_OF_COLUMNS, i)

assign control_data = controls.data;

`PACKED_TO_UNPACKED_CONVERTER(control_data[0], control_values.row[0], NUMBER_OF_COLUMNS, j)
`PACKED_TO_UNPACKED_CONVERTER(control_data[1], control_values.row[1], NUMBER_OF_COLUMNS, k)

assign wire_data[0] = targets.data;
assign wire_data[1] = control_data[0];
assign wire_data[2] = control_data[1];

///////////////////////////////////////////////////////////////////////////
// processing
///////////////////////////////////////////////////////////////////////////

assign targets.ready = wires.ready;
assign controls.ready = wires.ready;

CollisionCheck #(
  .NUMBER_OF_COLUMNS(NUMBER_OF_COLUMNS)
) collision_check (
  .clk(clk),
  .resetn(resetn),
  .targets(targets.data),
  .controls(controls.data),
  .collision(collisionDetected)
);

endmodule


`endif