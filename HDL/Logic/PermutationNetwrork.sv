`ifndef PERMUTATION_NETWORK_SV
 `define PERMUTATION_NETWORK_SV

module swap #(
  type data_type = PermutationPkg::NibbleType
) (
  input data_type input_val[0:1],
  output data_type output_val[0:1],
  input wire control
);

//swap
assign output_val[0] = control ? input_val[1] : input_val[0];
assign output_val[1] = control ? input_val[0] : input_val[1];

endmodule

module rotate #(
  type data_type = PermutationPkg::FiveWireType,
  parameter SIZE = 5
) (
  input data_type input_val,
  output data_type output_val,
  input wire control
);

data_type rotated;

genvar i;
for(i = 1; i < SIZE; i ++)
assign rotated[i - 1] = input_val[i];

assign rotated[SIZE - 1] = input_val[0];
//swap
assign output_val = control ? rotated : input_val;

endmodule

module riffle #(
  type data_type = PermutationPkg::FiveWireType,
  parameter SIZE = 5
) (
  input data_type input_val,
  output data_type output_val,
  input wire control
);

data_type riffle_even;
localparam HALF_SIZE = SIZE / 2;
//////////////////////////////////////////////////////////////////////////////////////
// even riffle
//////////////////////////////////////////////////////////////////////////////////////
genvar i;
for(i = 0; i <= HALF_SIZE; i ++)
begin
if ( i == HALF_SIZE )
begin
  if (2*i < SIZE)
  assign riffle_even[2*i] = input_val[i];
  if (((2*i)+1) < SIZE)
  assign riffle_even[2*i + 1] = input_val[i + HALF_SIZE];
end
else 
begin
  assign riffle_even[2*i] = input_val[i];  
  assign riffle_even[2*i + 1] = input_val[i + HALF_SIZE];  
end
end

//////////////////////////////////////////////////////////////////////////////////////
// odd riffle
//////////////////////////////////////////////////////////////////////////////////////
data_type riffle_odd;
for(i = 0; i <= HALF_SIZE; i ++)
begin
if ( i == HALF_SIZE )
begin
  if (2*i < SIZE)
  assign riffle_even[2*i] = input_val[i + HALF_SIZE];
  if (((2*i)+1) < SIZE)
  assign riffle_even[2*i + 1] = input_val[i];
end
else 
begin
  assign riffle_even[2*i] = input_val[i + HALF_SIZE];  
  assign riffle_even[2*i + 1] = input_val[i];  
end
end

//swap
assign output_val = control ? riffle_even : riffle_odd;

endmodule

module swap_3 #(
    type data_type = PermutationPkg::NibbleType
) (
  input data_type input_val[0:2],
  output data_type output_val[0:2],
  input wire [2:0] control
);
/////////////////////////////////////////////////////////////////
// internal wires
/////////////////////////////////////////////////////////////////
logic [2:0] first_layer, second_layer;

/////////////////////////////////////////////////////////////////
//layer 1
/////////////////////////////////////////////////////////////////
assign first_layer[0] = control[0] ? input_val[1] : input_val[0];
assign first_layer[1] = control[0] ? input_val[0] : input_val[1];
assign first_layer[2] = input_val[2];

/////////////////////////////////////////////////////////////////
//layer 2
/////////////////////////////////////////////////////////////////
assign second_layer[0] = first_layer[0];
assign second_layer[1] = control[1] ? first_layer[2] : first_layer[1];
assign second_layer[2] = control[1] ? first_layer[1] : first_layer[2];

/////////////////////////////////////////////////////////////////
//layer 3
/////////////////////////////////////////////////////////////////
assign output_val[0] = control[2] ? second_layer[1] : second_layer[0];
assign output_val[1] = control[2] ? second_layer[0] : second_layer[1];
assign output_val[2] = second_layer[2];

endmodule : swap_3

module swap_5 #(
    type data_type = PermutationPkg::NibbleType
) (
  input data_type input_val[0:4],
  output data_type output_val[0:4],
  input wire [7:0] control
);
/////////////////////////////////////////////////////////////////
// internal wires
/////////////////////////////////////////////////////////////////
data_type first_layer [0:4], second_layer[0:4];

/////////////////////////////////////////////////////////////////
// first layer
/////////////////////////////////////////////////////////////////
swap #(
    .data_type(data_type)
) swap_first_1 (
  .input_val(input_val[0:1]),
  .output_val(first_layer[0:1]),
  .control(control[0])
);

swap #(
    .data_type(data_type)
) swap_first_2 (
  .input_val(input_val[2:3]),
  .output_val(first_layer[2:3]),
  .control(control[1])
);

assign first_layer[4] = input_val[4];

/////////////////////////////////////////////////////////////////
// second layer
/////////////////////////////////////////////////////////////////
data_type mix_2 [0:1];
data_type mix_3 [0:2];
swap #(
    .data_type(data_type)
) swap_second_1 (
  .input_val({first_layer[0],first_layer[2]}),
  .output_val(mix_2),
  .control(control[2])
);

assign {second_layer[0],second_layer[2]} = {mix_2[0],mix_2[1]};

swap_3 #(
    .data_type(data_type)
) swap_second_2 (
  .input_val({first_layer[1],first_layer[3], first_layer[4]}),
  .output_val(mix_3),
  .control(control[5:3])
);

assign {second_layer[1],second_layer[3], second_layer[4]} = {mix_3[0], mix_3[1], mix_3[2]};

/////////////////////////////////////////////////////////////////
// third layer
/////////////////////////////////////////////////////////////////

swap #(
    .data_type(data_type)
) swap_third_1 (
  .input_val(second_layer[0:1]),
  .output_val(output_val[0:1]),
  .control(control[6])
);

swap #(
    .data_type(data_type)
) swap_third_2 (
  .input_val(second_layer[2:3]),
  .output_val(output_val[2:3]),
  .control(control[7])
);

assign output_val[4] = second_layer[4];


endmodule : swap_5

`define PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) \
  genvar ITERATOR; \
  for ( ITERATOR = 0; ITERATOR < SIZE; ITERATOR ++) \
  assign DEST[ITERATOR] = SOURCE[ITERATOR]; 

`define UNPACKED_TO_PACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR) `PACKED_TO_UNPACKED_CONVERTER(SOURCE, DEST, SIZE, ITERATOR)

module PermuteNetwork5 #(
    type data_type = PermutationPkg::NibbleType,
    type stream_type = PermutationPkg::FiveWireType
) (
  input wire clk,
  input wire resetn,
  input wire [7:0] control,
  AXI4S.Master out,
  AXI4S.Slave in 
);
/////////////////////////////////////////////////////////////////
// internal wires
/////////////////////////////////////////////////////////////////
data_type input_layer [0:4], output_layer [0:4];


/////////////////////////////////////////////////////////////////
// permutation of wires
/////////////////////////////////////////////////////////////////

swap_5 #(
  .data_type(data_type)
) swap (
  .input_val(input_layer),
  .output_val(output_layer),
  .control(control)
);

/////////////////////////////////////////////////////////////////
// I/O management
/////////////////////////////////////////////////////////////////
stream_type in_data, out_data;
`PACKED_TO_UNPACKED_CONVERTER(in_data, input_layer, 5, i)
`UNPACKED_TO_PACKED_CONVERTER(output_layer, out_data, 5, j)

assign in_data = in.data;
assign out.data = out_data;

assign out.valid = in.valid;
assign out.last = in.last;
assign in.ready = out.ready;

endmodule

`endif