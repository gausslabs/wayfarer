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
wire [OUTPUT_SIZE - 1:0] exclude;

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
    GENRATE,
    SEND
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
  currentState <= 0;
end
end
logic clash;
always_comb
begin
  case (currentState)
    WAIT:
        begin
          if (next) 
            nextState = GENRATE;
          else
            nextState = WAIT;
        end
    GENRATE:
        begin
          if (~clash)
            nextState == SEND;
          else
            nextState == GENRATE;
        end
    SEND:
      begin
        nextState = WAIT;
      end
      
  endcase
end

///////////////////////////////////////////////////////////////////////
// Generatrion 
///////////////////////////////////////////////////////////////////////

assign clash = (randomNumber == exclude);
assign valid = (currentState == SEND);

LFSR lfsr (
  .clk           (clk   ),
  .resetn        (resetn),
  .next          (next (currentState == GENRATE) ),
  .seed         (seed),
  .random_number(randomNumber)
);


endmodule


`endif