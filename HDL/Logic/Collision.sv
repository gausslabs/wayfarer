`ifndef COLLISION_CHECK
 `define COLLISION_CHECK

`ifndef PACKED_TO_UNPACKED_CONVERTER
`define PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) \
  genvar ITERATOR; \
  for ( ITERATOR = 0; ITERATOR < SIZE; ITERATOR ++) \
  assign DEST[ITERATOR] = SOURCE[ITERATOR]; 

`define UNPACKED_TO_PACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) `PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR)
`endif

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
  input wire validIn,
  output logic validOut,
  input wire readyIn,
  output logic readyOut,
  input ShufflePkg::WireData wireDataIn,
  output ShufflePkg::WireData wireDataOut,
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
  wireDataOut <= wireDataIn;
  validOut <= validIn;
  collision <= |collisionDetected;
end
else
begin
 collision <= 0;
end
end

assign readyOut = readyIn;

///////////////////////////////////////////////////////////////////////////
// processing
///////////////////////////////////////////////////////////////////////////
genvar i;
for (i=0; i<NUMBER_OF_COLUMNS; i++) 
begin

RowCollisionCheck row_check (
  .target(targets.row[i]),
  .control_1(controls.row[0][i]),
  .control_2(controls.row[1][i]),
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
ShufflePkg::TargetStream target_data;
ShufflePkg::ControlData control_data;
ShufflePkg::WireData wire_data_in, wire_data_out;
ShufflePkg::Controls control_values;
logic collision_ready, collision_valid;
logic collisionDetected;

///////////////////////////////////////////////////////////////////////////
// output
///////////////////////////////////////////////////////////////////////////

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (wires.ready)
  begin
    wires.data <= wire_data_out;  
    wires.valid <= collision_valid;
    collision <= collisionDetected;
  end
end
else
begin
  wires.data <= 0;  
  wires.valid <= 0;
  collision <= 0;
end
end


///////////////////////////////////////////////////////////////////////
// Data management
///////////////////////////////////////////////////////////////////////

`PACKED_TO_UNPACKED_CONVERTER(target_data, target_values.row, NUMBER_OF_COLUMNS, i)

assign target_data = targets.data;
assign control_data = controls.data;

`PACKED_TO_UNPACKED_CONVERTER(control_data[0], control_values.row[0], NUMBER_OF_COLUMNS, j)
`PACKED_TO_UNPACKED_CONVERTER(control_data[1], control_values.row[1], NUMBER_OF_COLUMNS, k)

assign wire_data_in[0] = targets.data;
assign wire_data_in[1] = control_data[0];
assign wire_data_in[2] = control_data[1];

///////////////////////////////////////////////////////////////////////////
// processing
///////////////////////////////////////////////////////////////////////////

assign targets.ready = collision_ready;
assign controls.ready = collision_ready;

CollisionCheck #(
  .NUMBER_OF_COLUMNS(NUMBER_OF_COLUMNS)
) collision_check (
  .clk(clk),
  .resetn(resetn),
  .validIn(targets.valid & controls.valid),
  .validOut(collision_valid),
  .readyIn(wires.ready),
  .readyOut(collision_ready),
  .wireDataIn(wire_data_in),
  .wireDataOut(wire_data_out),
  .targets(target_values),
  .controls(control_values),
  .collision(collisionDetected)
);

endmodule


`endif