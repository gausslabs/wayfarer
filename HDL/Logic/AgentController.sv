`ifndef AGENT_CONTROLLER
 `define AGENT_CONTROLLER

module AgentController #(
    parameter long int ATTEMPT_COUNT_SIZE = $clog2(1_000_000_000),
    parameter long int ATTEMPT_COUNT_LIMIT = 1_000_000_000,
    parameter SAMPLE_COUNT_SIZE = 8,
    parameter SAMPLE_COUNT_LIMIT = 1 << SAMPLE_COUNT_SIZE,
    parameter RUN_TIME_COUNT_SIZE = 8
)(
  input wire clk,
  input wire resetn,
  input wire equal,
  input wire validConfig,
  input valid samplingComplete,
  input wire [SAMPLE_COUNT_SIZE - 1:0] sampleCount,
  input wire [RUN_TIME_COUNT_SIZE - 1:0] runTimeCount,
  output logic [ATTEMPT_COUNT_SIZE - 1:0] attemptCount,
  output logic found,
  output logic loadConfig,
  output logic sample,
  output logic timedOut,
  output logic resetDataFlow
);
///////////////////////////////////////////////////////////////////////////
// INTERNAL NETS
///////////////////////////////////////////////////////////////////////////
logic attempt_increment;
logic [ATTEMPT_COUNT_SIZE - 1:0] attemptCountValue;
///////////////////////////////////////////////////////////////////////////
// FSM
///////////////////////////////////////////////////////////////////////////

typedef enum logic [2:0] {
LOAD_CONFIG,
PROCESS,
SAMPLE,
TIMED_OUT,
RESULT_FOUND
} State;
State current_state, next_state;



always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= LOAD_CONFIG;
end
end



always_comb
begin
  case (current_state)
     LOAD_CONFIG:
        next_state = validConfig ? PROCESS : LOAD_CONFIG;
     PROCESS:
     begin
        if (~validConfig)
        begin
        if (attemptCount == ATTEMPT_COUNT_LIMIT)
          next_state = TIMED_OUT;
        else
          next_state = equal ?(sampleCount == SAMPLE_COUNT_LIMIT ? RESULT_FOUND : PROCESS ): SAMPLE;
        end
        else
        begin
          next_state = LOAD_CONFIG;
        end
     end
     SAMPLE:
     begin
        if (~validConfig)
        begin
          next_state = samplingComplete ? PROCESS : SAMPLE;
        end
        else
        begin
          next_state = LOAD_CONFIG;
        end
     end
     TIMED_OUT:
        next_state = validConfig ? LOAD_CONFIG : TIMED_OUT;
     RESULT_FOUND:
        next_state = validConfig ? LOAD_CONFIG : RESULT_FOUND;
     default: begin
        next_state = LOAD_CONFIG;
     end
  endcase
end

always_comb
begin
  case (current_state)
     LOAD_CONFIG:
     begin
        loadConfig = 1;
        resetDataFlow = 0;
        sample = 0;
        found = 0;
        timedOut = 0;
     end
     PROCESS:
     begin
        loadConfig = 0;
        resetDataFlow = 1;
        sample = 0;
        found =  0;
        timedOut = 0;
     end
     SAMPLE:
     begin
        loadConfig = 0;
        resetDataFlow = 0;
        sample = 1;
        found =  0;
        timedOut = 0;
     end
     RESULT_FOUND:
     begin
        loadConfig = 0;
        resetDataFlow = 0;
        sample = 0;
        found =  1;
        timedOut = 0;
     end
     TIMED_OUT:
     begin
        loadConfig = 0;
        resetDataFlow = 0;
        sample = 0;
        found =  0;
        timedOut = 1;
     end
     default: begin
        loadConfig = 0;
        resetDataFlow = 0;
        sample = 0;
        found = 0;
        timedOut = 0;
     end
  endcase
end

///////////////////////////////////////////////////////////////////////////
// Attempt count
///////////////////////////////////////////////////////////////////////////

PulseGenerator pulse_generator (
  .clk(clk),
  .resetn(sample),
  .pulse(attempt_increment)
);

CounterWithLimit #(
  .COUNTER_WIDTH(ATTEMPT_COUNT_SIZE),
  .LIMIT(ATTEMPT_COUNT_LIMIT)
) attempt_counter (
  .clk(clk),
  .resetn(resetn),
  .enable(attempt_increment),
  .count(attemptCountValue)
);

assign attemptCount = resetn ? attemptCountValue : attemptCountValue + 1;

endmodule

module ShuffleCoordinator (
  input wire clk,
  input wire resetn,
  input wire sample,
  input wire validShuffle,
  input wire validSample,
  output logic enableShuffle,
  output logic enableSample
);
///////////////////////////////////////////////////////////////////////////
// FSM
///////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] {
IDLE,
SHUFFLE,
SAMPLE
} State;
State current_state, next_state;



always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= IDLE;
end
end



always_comb
begin
  case (current_state)
     IDLE:
        next_state = sample ? SHUFFLE : IDLE;
     SHUFFLE:
        next_state = sample ? (validShuffle ? SAMPLE : SHUFFLE) : IDLE;
     SAMPLE:
        next_state = sample ? (validSample ? SAMPLE : IDLE) : IDLE;
     default: begin
        next_state = IDLE;
     end
  endcase
end
///////////////////////////////////////////////////////////////////////////
// Control Signals
///////////////////////////////////////////////////////////////////////////
always_comb
begin
  case (current_state)
     IDLE:
     begin
        enableShuffle = 0;
        enableSample = 0;
     end
     SHUFFLE:
     begin
        enableShuffle = 1;
        enableSample = 0;
     end
     SAMPLE:
     begin
        enableShuffle = 0;
        enableSample = 1;
     end
     default: begin
        enableShuffle = 0;
        enableSample = 0;
     end
  endcase
end

endmodule

module HandShake (
  input wire clk,
  input wire resetn,
  input wire valid,
  input wire readyIn,
  output logic readyOut,
  output logic syncing
);

typedef enum logic [1:0] {
WAITING,
SYNCING,
DONE
} State;
State current_state, next_state;



always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= WAITING;
end
end



always_comb
begin
  case (current_state)
     WAITING:
        next_state = valid ? SYNCING : WAITING;
     SYNCING:
        next_state = readyIn ? DONE : SYNCING;
     DONE:
        next_state = DONE;
     default: begin
        next_state = WAITING;
     end
  endcase
end

always_comb
begin
  case (current_state)
     WAITING:
     begin
        readyOut = 0;
        syncing = 0;
     end
     SYNCING:
     begin
        readyOut = 0;
        syncing = 1;
     end
     DONE:
     begin
        readyOut = 1;
        syncing = 0;
     end
     default: begin
        readyOut = 0;
        syncing = 0;
     end
  endcase
end

endmodule

`endif