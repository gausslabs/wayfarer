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

FSM current_state, next_state;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= WAIT;
end
end
logic clash;
always_comb
begin
  case (current_state)
    WAIT:
        begin
          if (next) 
            next_state = SEND;
          else
            next_state = WAIT;
        end
    SEND:
      begin
        next_state = GENRATE;
      end
    GENRATE:
      begin
        next_state = WAIT;
      end
    default:
      next_state = WAIT;
  endcase
end

///////////////////////////////////////////////////////////////////////
// Generatrion 
///////////////////////////////////////////////////////////////////////

assign clash = (randomNumber == exclude);
assign valid = (current_state == SEND) & (~clash);

LFSR lfsr (
  .clk           (clk   ),
  .resetn        (resetn),
  .next          (next & (current_state == GENRATE) ),
  .seed         (seed),
  .random_number(randomNumber)
);


endmodule


`endif