`ifndef PRNG_SV
 `define PRNG_SV

module PRNG #(
    parameter OUTPUT_SIZE = 4,
    parameter LFSR_SIZE   = 8
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [LFSR_SIZE - 1:0] seed,
  input wire [OUTPUT_SIZE - 1:0] excludeValue,
  output wire valid,
  output logic [OUTPUT_SIZE - 1:0] randomNumber
);
///////////////////////////////////////////////////////////////////////
// Internal variables
///////////////////////////////////////////////////////////////////////
reg [OUTPUT_SIZE - 1:0] exclude;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  exclude <= exclude;
end
else
begin
  exclude <= excludeValue;
end
end

///////////////////////////////////////////////////////////////////////
// Generatrion FSM
///////////////////////////////////////////////////////////////////////

typedef enum bit[1:0] { 
    WAIT,
    SEND,
    GENRATE
 } FSM;

FSM currentState, nextState;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  currentState <= nextState;
end
else
begin
  currentState <= WAIT;
end
end
logic clash;
always_comb
begin
  case (currentState)
    WAIT:
        begin
          if (next) 
            nextState = SEND;
          else
            nextState = WAIT;
        end
    SEND:
      begin
        nextState = GENRATE;
      end
    GENRATE:
      begin
        nextState = WAIT;
      end
    default:
      nextState = WAIT;
  endcase
end

///////////////////////////////////////////////////////////////////////
// Generatrion 
///////////////////////////////////////////////////////////////////////

assign clash = (randomNumber == exclude);
assign valid = (currentState == SEND) & (~clash);

LFSR lfsr (
  .clk           (clk   ),
  .resetn        (resetn),
  .next          (next & (currentState == GENRATE) ),
  .seed         (seed),
  .random_number(randomNumber)
);


endmodule


`endif