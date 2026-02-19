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
logic full;

///////////////////////////////////////////////////////////////////////
// Recorder Section
///////////////////////////////////////////////////////////////////////

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
  recorderState <= WAITING;
end
end

always_comb
begin
  case (recorderState)
    WAITING:
      begin
        if(record)
          recorderNextState = RECORD;
        else
          recorderNextState = WAITING;
      end
    RECORD:
      begin
        if(~record)
          recorderNextState = WAITING;
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
        recorderNextState = WAITING;
      else
        recorderNextState = LAST_SAMPLE_RECORDED;
    end
    default: begin
      recorderNextState = WAITING;
    end
  endcase
end


///////////////////////////////////////////////////////////////////////
// Recording control
///////////////////////////////////////////////////////////////////////

SaturatingCounter #(
  .COUNTER_WIDTH(STORE_WIDTH)
) recordCounter (
  .clk    (clk    ),
  .resetn (resetn & (recorderState == RECORD)),
  .run    (in.valid    ),
  .limitReached(full),
  .count  (writePointer)
);

// essentially tells the block sending this data that
// it is ready to take data only when its not full and
// the a single last has not arrived on the input stream.
assign in.ready = (~full) & (recorderState == RECORD);

always_ff @ (posedge clk)
begin
if(resetn)
begin
  if ((recorderState == RECORD) & in.valid & (full)) 
    store[writePointer] <= in.data;
end
else
begin
  for (int i=0; i<(1 << STORE_WIDTH); ++i) begin
    store[i] <= 0;
  end
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

///////////////////////////////////////////////////////////////////////
// Player Section
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
// player FSM
///////////////////////////////////////////////////////////////////////
typedef enum bit { 
  WAIT,
  PLAY,
  LAST_SAMPLE_SENT
} PlayerFSM;

PlayerFSM playerState, playerNextState;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  playerState <= playerNextState;
end
else
begin
  playerState <= WAIT;
end
end

always_comb
begin
case (playerState)
  WAIT:
  begin
    if (play)
      playerNextState = PLAY;
    else
      playerNextState = WAIT;
  end
  PLAY:
  begin
    if (play)
    begin
      if (out.ready & out.valid & out.last)
        playerNextState = LAST_SAMPLE_SENT;
      else 
        playerNextState = PLAY;
    end
    else
      playerNextState = WAIT;
  end
  LAST_SAMPLE_SENT:
  begin
    if (play)
      playerNextState = LAST_SAMPLE_SENT;
    else
      playerNextState = WAIT;
  end
  default: begin
    playerNextState = WAIT;
  end
endcase
end

///////////////////////////////////////////////////////////////////////
// player control
///////////////////////////////////////////////////////////////////////

logic last;
ControlledCounter #(
  .COUNTER_WIDTH(STORE_WIDTH)
) playCounter (
  .clk    (clk    ),
  .resetn (resetn & (playerState == PLAY)),
  .run    (out.ready    ),
  .limitReached(last),
  .limit   (valuesStored),
  .count  (readPointer)
);

always_ff @ (posedge clk)
begin
if(resetn)
begin
  out.last = last;
  out.valid = (playerState == PLAY);
  if ((playerState == PLAY) & out.ready ) 
    out.data <= store[readPointer];
end
else
begin
  out.data <= 0;
  out.last <= 0;
  out.valid <= 0;
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
  if (run & (counter <= (limit)))
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign limitReached = ((counter) == (limit));
assign count = counter[COUNTER_WIDTH - 1:0];


endmodule


`endif