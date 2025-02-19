`ifndef PRNG_SV
 `define PRNG_SV

module SimplePRNG #(
    parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_08,
    parameter LFSR_SIZE   = LFSRPkg::port_bit_width(LFSR_TYPE),
    parameter ENABLE_MODULO = 0,
    parameter MODULO_VALUE = 8'd24,
    parameter OUTPUT_SIZE = 4
) (
  input wire clk,
  input wire resetn,
  input wire next,
  input wire [LFSR_SIZE - 1:0] seed,
  output logic valid,
  output logic [OUTPUT_SIZE - 1:0] randomNumber
);

initial
begin
  output_width_less_than_lfsr_size: assert (OUTPUT_SIZE < LFSR_SIZE)
    else
    begin 
    $error("Assertion output width less than lfsr size failed!");
    $finish();
    end
end

///////////////////////////////////////////////////////////////////////
// Internal variables
///////////////////////////////////////////////////////////////////////
logic [LFSR_SIZE - 1:0] random_number;

///////////////////////////////////////////////////////////////////////
// ranom number generation
///////////////////////////////////////////////////////////////////////
LFSR #(
  .LFSR_TYPE(LFSR_TYPE)
) lfsr (
  .clk           (clk   ),
  .resetn        (resetn),
  .next          (next ),
  .seed         (seed),
  .random_number(random_number)
);
if (ENABLE_MODULO == 1)
begin
always_ff @ (posedge clk)
begin
if(resetn)
begin
  valid <= next;
  if (random_number > MODULO_VALUE)
  randomNumber <= random_number - MODULO_VALUE;
  else
  randomNumber <= random_number;
end
else
begin
  valid <= 0;
  randomNumber <= 0;
end
end
end
else
begin
assign randomNumber = random_number[OUTPUT_SIZE - 1:0];
assign valid = next;
end

endmodule

module PRNG #(
    parameter LFSRPkg::LFSRType LFSR_TYPE  = LFSRPkg::LFSR_08,
    parameter LFSR_SIZE   = LFSRPkg::port_bit_width(LFSR_TYPE),
    parameter OUTPUT_SIZE = 4
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

LFSR #(
  .LFSR_TYPE(LFSR_TYPE)
) lfsr (
  .clk           (clk   ),
  .resetn        (resetn),
  .next          (next & (current_state == GENRATE) ),
  .seed         (seed),
  .random_number(randomNumber)
);


endmodule


`endif