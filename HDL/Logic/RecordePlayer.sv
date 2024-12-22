`ifndef RECORDER_PLAYER
 `define RECORDER_PLAYER

module RecorderAndPlayer #(
  parameter STORE_WIDTH = 8,
  parameter WIRE_WIDTH  = 3
)(
  input wire clk,
  input wire resetn,
  input wire record,
  input wire play,
  AXI4S.Master out,
  AXI4S.Slave in
);
///////////////////////////////////////////////////////////////////////
// Store and Variable for book keeping
///////////////////////////////////////////////////////////////////////
logic [WIRE_WIDTH - 1:0] store [STORE_WIDTH - 1:0];
logic [STORE_WIDTH - 1:0] writePointer;
logic [STORE_WIDTH - 1:0] valuesStored;
logic [STORE_WIDTH - 1:0] readPointer;

///////////////////////////////////////////////////////////////////////
// Recording FSM
///////////////////////////////////////////////////////////////////////
typedef enum bit [1:0] { 
  WAITING,
  RECORD,
  LAST_SAMPLE_RECORDED
} RecorderFSM;

RecorderFSM recorderState, recorderNextState;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  recorderState <= recorderNextState;
end
else
begin
  recorderState <= WAIT;
end
end

always_comb
begin
  case (recorderState)
    WAIT:
      begin
        if(record)
          recorderNextState = RECORD;
        else
          recorderNextState = WAIT;
      end
    RECORD:
      begin
        if(~record)
          recorderNextState = WAIT;
        else
        begin
          if (in.valid & in.last)
            recorderNextState = LAST_SAMPLE_RECORDED;
          else
            recorderNextState = RECORD;
        end
      end
    LAST_SAMPLE_RECORDED:
    begin
      if(~record)
        recorderNextState = WAIT;
      else
        recorderNextState = LAST_SAMPLE_RECORDED;
    end
    default: begin
      recorderNextState = WAIT;
    end
  endcase
end


///////////////////////////////////////////////////////////////////////
// Recording FSM based control
///////////////////////////////////////////////////////////////////////

SaturatingCounter #(
  .COUNTER_WIDTH(STORE_WIDTH)
) recordCounter (
  .clk    (clk    ),
  .resetn (resetn & (recorderState == RECORD)),
  .run    (in.valid    ),
  .limitReached(in.ready),
  .count  (writePointer)
);

// delayed full is required 
logic delayedFull;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  delayedFull <= full;
  if ((recorderState == RECORD) & in.valid & (delayedFull)) 
    store[writePointer] <= in.data;
end
else
begin
  store <= 0;
  delayedFull <= 0;
end
end

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if(recorderState == RECORD)
    valuesStored <= writePointer;
end
else
begin
  valuesStored <= 0;
end
end



endmodule


module SaturatingCounter #(
  parameter COUNTER_WIDTH = 8
) (
  input wire clk,
  input wire resetn,
  input wire run,
  input wire limitReached,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (run & (counter < (1<<COUNTER_WIDTH)))
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign limitReached = ((counter + 1) == (1<<COUNTER_WIDTH));
assign count = counter[COUNTER_WIDTH - 1:0];


endmodule

module ControlledCounter #(
  parameter COUNTER_WIDTH = 8
) (
  input wire clk,
  input wire resetn,
  input wire run,
  input wire limitReached,
  input wire [COUNTER_WIDTH - 1:0] limit,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (run & (counter < (limit)))
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign limitReached = ((counter + 1) == (limit));
assign count = counter[COUNTER_WIDTH - 1:0];


endmodule


`endif