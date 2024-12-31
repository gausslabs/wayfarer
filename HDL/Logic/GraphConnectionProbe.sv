`ifndef GRAPH_CONNECTION_PROBE
 `define GRAPH_CONNECTION_PROBE

module GraphConnectionProbe #(
    parameter ROWS = 3,
    parameter COLUMNS = 3
) (
  input wire clk,
  input wire resetn,
  input wire [COLUMNS - 1:0] graphConnectionsList [ROWS-1:0],
  output logic isWeaklyConnected
);

///////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////
logic [COLUMNS - 1:0] collapsed_row_form;


endmodule

module TreeAdder #(
    parameter NUMBER_OF_INPUTS = 3,
    parameter INPUT_WIDTH = 1
)(
  input wire [INPUT_WIDTH - 1: 0] inputs [NUMBER_OF_INPUTS - 1:0],
  output logic [(NUMBER_OF_INPUTS + INPUT_WIDTH) - 1:0] output
);

if (NUMBER_OF_INPUTS == 1)
begin
    assign output = input[0];
end
else if (NUMBER_OF_INPUTS == 2)
begin
    assign output = input[0] + input[1];
end
else
begin
localparam EVEN_NUMBER_OF_INPUTS = NUMBER_OF_INPUTS/2;
localparam ODD_NUMBER_OF_INPUTS = NUMBER_OF_INPUTS - EVEN_NUMBER_OF_INPUTS;

logic [(EVEN_NUMBER_OF_INPUTS + INPUT_WIDTH) - 1:0] evenOutput;
TreeAdder #(
    .NUMBER_OF_INPUTS(EVEN_NUMBER_OF_INPUTS),
    .INPUT_WIDTH(INPUT_WIDTH)
)evenSum(
  .inputs(inputs[EVEN_NUMBER_OF_INPUTS:0]),
  .output(evenOutput)
);

logic [(ODD_NUMBER_OF_INPUTS + INPUT_WIDTH) - 1:0] oddOutput;
TreeAdder #(
    .NUMBER_OF_INPUTS(ODD_NUMBER_OF_INPUTS),
    .INPUT_WIDTH(INPUT_WIDTH)
)oddSum(
  .inputs(inputs[ODD_NUMBER_OF_INPUTS:0]),
  .output(oddOutput)
);

assign output = evenSum + oddSum;
    
end

endmodule

module GraphConstructor #(
    parameter WIRE_PERMUTATION_WIDTH = 5,
    parameter NO_OF_WIRES = 3,
    parameter GATE_STAGES = 3,
    parameter ROWS = GATE_STAGES,
    parameter COLUMNS = GATE_STAGES
) (
  input wire clk,
  input wire resetn,
  input wire [WIRE_PERMUTATION_WIDTH -1:0] [NO_OF_WIRES - 1:0] gates [GATE_STAGES -1 :0];
  output logic [COLUMNS - 1:0] graphConnectionsList [ROWS-1:0]
);

///////////////////////////////////////////////////////////////////////
// Internal signals
///////////////////////////////////////////////////////////////////////
logic [COLUMNS - 1:0] connections [ROWS-1:0]; 

///////////////////////////////////////////////////////////////////////
// Comparing the connection list
///////////////////////////////////////////////////////////////////////

genvar i,j,k,l;
generate;
    for(i = 0; i < GATE_STAGES; i ++)
    begin
        logic [GATE_STAGES - 1:0] single_node_connections;
        for(j = 0; j < GATE_STAGES; j++)
        begin
            // iterating all other gates to check if they are connected(connection criteria have a atleast one wire in common)
            if (i == j)
            begin
                single_node_connections[j] = 1'b1; 
            end
            else
            begin
                logic [NO_OF_WIRES - 1:0] comparisons;
                // checking all the wires between two gates 
                for(k = 0; k < NO_OF_WIRES; k++)
                begin
                    logic [NO_OF_WIRES - 1:0] row_comparisons;
                    for(l = 0; l < NO_OF_WIRES; l++)
                    begin
                        // comparing ith gates kth input with all of jth gates inputs 
                        assign row_comparisons[l] = (gates[i][k] == gates[j][l]);
                    end
                    // Checking if ith gates kth input is the same as one of jth gates inputs 
                    assign comparisons[k] = |row_comparisons;
                end
                // Checking if ith gate and the jth gate have connection if one of the inputs overlaps
                assign single_node_connections[j] = |comparisons;
            end
        end
        // arranging the connections into a matrix
        assign connections[i] = single_node_connections;
    end
endgenerate

///////////////////////////////////////////////////////////////////////
// Output registering
///////////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  for(int i =0; i < ROWS; i ++)
    graphConnectionsList[i] <= connections[i];
end
else
begin
  for(int i =0; i < ROWS; i ++)
    graphConnectionsList[i] <= 0;
end
end

endmodule


`endif