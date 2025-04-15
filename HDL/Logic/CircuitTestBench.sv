`ifndef CIRCUIT_TEST_BENCH
 `define CIRCUIT_TEST_BENCH

module CircuitTestBench #(
  parameter NUMBER_OF_GATES = 5,
  parameter NUMBER_OF_STAGES = 8,
  parameter NUMBER_OF_INPUT_WIRES = 11,
  parameter SAMPLE_COUNT_WIDTH = NUMBER_OF_INPUT_WIRES - $clog2(NUMBER_OF_STAGES)
) (
  input wire clk,
  input wire resetn,
  input wire validConfigIn,
  input AgentPkg::GateConfig searchGateConfigs [NUMBER_OF_GATES - 1:0],
  input AgentPkg::GateConfig referenceGateConfigs [NUMBER_OF_GATES - 1:0],
  output logic done,
  output logic equal,
  output logic [SAMPLE_COUNT_WIDTH:0] count
);
initial
begin
  input_size: assert (NUMBER_OF_STAGES % 2 == 0)
    else
    begin
    $error("Assertion number of stages parameter is not divisible by 2 got -> %d!",NUMBER_OF_STAGES);
    $finish;
    end
end
///////////////////////////////////////////////////////////////////////////
// Internal nets
///////////////////////////////////////////////////////////////////////////
logic [NUMBER_OF_STAGES - 1:0] counters_done, comparator_output, gate_inp_valids, source_valids;

AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) source [0:NUMBER_OF_STAGES -1]();
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gate_input [0:2] [0:NUMBER_OF_STAGES -1]();
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) passthrough [0:2] [0:NUMBER_OF_STAGES -1]();
logic [NUMBER_OF_GATES - 1:0] seach_config_loaded; 
logic [NUMBER_OF_GATES - 1:0] config_loaded; 
logic [NUMBER_OF_GATES - 1:0] reference_config_loaded;


assign done = &counters_done;
assign equal = &comparator_output;
assign config_loaded = seach_config_loaded & reference_config_loaded;

/////////////////////////////////////////////////////////////////////////
// Counter sources
/////////////////////////////////////////////////////////////////////////

genvar i;
for ( i=0; i<NUMBER_OF_STAGES; i++) 
begin
  assign source_valids[i] = source[i].valid;
    AXISCounterWithMask #(
      .TOTAL_WIDTH(NUMBER_OF_INPUT_WIRES),
      .MASK(i),
      .DATA_WIDTH(SAMPLE_COUNT_WIDTH)
    ) source_counter (
      .clk(clk),
      .resetn(resetn & (&config_loaded)),
      .done(counters_done[i]),
      .out(source[i])
    );

    Duplicator tee_junction (
        .streamOne(gate_input[0][i]),
        .streamTwo(passthrough[0][i]),
        .in(source[i])
    );
end

/////////////////////////////////////////////////////////////////////////
// Search Circuit
///////////////////////////////////////////////////////////////////////////

ParallelStreamingCircuit #(
  .NUMBER_OF_GATES(NUMBER_OF_GATES),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) search_circuit (
  .clk(clk),
  .resetn(resetn),
  .validConfigIn(validConfigIn),
  .validConfigOut(seach_config_loaded), 
  .configs(searchGateConfigs),
  .out(gate_input[1]),  
  .passThroughOut(passthrough[1]),
  .in(gate_input[0]), 
  .passThroughIn(passthrough[0])
);

/////////////////////////////////////////////////////////////////////////
// Reference Circuit
///////////////////////////////////////////////////////////////////////////

ParallelStreamingCircuit #(
  .NUMBER_OF_GATES(NUMBER_OF_GATES),
  .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
  .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
) reference_circuit (
  .clk(clk),
  .resetn(resetn),
  .validConfigIn(validConfigIn),
  .validConfigOut(reference_config_loaded), 
  .configs(searchGateConfigs),
  .out(gate_input[2]),  
  .passThroughOut(passthrough[2]),
  .in(gate_input[1]), 
  .passThroughIn(passthrough[1])
);

/////////////////////////////////////////////////////////////////////////
// Comparators
/////////////////////////////////////////////////////////////////////////


genvar k;
for ( k=0; k<NUMBER_OF_STAGES; k++) 
begin

assign gate_inp_valids[k] = gate_input[2][k].valid & passthrough[2][k].valid;

AXISComparatorNoReadyHandling #(
  .NAME($sformatf("Input: %0d", k))
) comparator (
  .clk(clk),
  .resetn(resetn & (&config_loaded)),
  .in1(gate_input[2][k]),
  .in2(passthrough[2][k]),
  .lastReached(),
  .equal(comparator_output[k])
);
end


SimpleCounter #(
  .COUNTER_WIDTH(SAMPLE_COUNT_WIDTH+1)
) sample_pass_count (
  .clk(clk),
  .resetn(resetn & (&config_loaded)),
  .enable((&comparator_output) & (&gate_inp_valids) ),
  .count(count)
);

endmodule : CircuitTestBench

module ParallelStreamingCircuit #(
  parameter NUMBER_OF_GATES = 5,
  parameter NUMBER_OF_STAGES = 8,
  parameter NUMBER_OF_INPUT_WIRES = 11,
  parameter CHOICE_WIDTH          = $clog2(NUMBER_OF_INPUT_WIRES)
) (
  input wire clk,
  input wire resetn,
  input wire validConfigIn,
  output logic [NUMBER_OF_GATES - 1:0] validConfigOut,
  input AgentPkg::GateConfig configs [NUMBER_OF_GATES - 1:0],
  AXI4S.Master out [NUMBER_OF_STAGES - 1:0],  
  AXI4S.Master passThroughOut [NUMBER_OF_STAGES - 1:0],
  AXI4S.Slave in [NUMBER_OF_STAGES - 1:0], 
  AXI4S.Slave passThroughIn [NUMBER_OF_STAGES - 1:0]
);
/////////////////////////////////////////////////////////////////////////
// Internal nets
/////////////////////////////////////////////////////////////////////////
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) gate_input [0:NUMBER_OF_GATES] [0:NUMBER_OF_STAGES -1]();
AXI4S #(.DATA_WIDTH(NUMBER_OF_INPUT_WIRES)) passthrough [0:NUMBER_OF_GATES] [0:NUMBER_OF_STAGES -1]();

/////////////////////////////////////////////////////////////////////////
// Connecting to external sources
/////////////////////////////////////////////////////////////////////////
genvar i;
for ( i=0; i<NUMBER_OF_STAGES; i++) 
begin
StreamConnector in_gate (
  .out(gate_input[0][i]),
  .in(in[i])
);

StreamConnector in_pass_through (
  .out(passthrough[0][i]),
  .in(passThroughIn[i])
);

StreamConnector out_pass_through (
  .out(passThroughOut[i]),
  .in(passthrough[NUMBER_OF_GATES][i])
);

StreamConnector out_gate (
  .out(out[i]),
  .in(gate_input[NUMBER_OF_GATES][i])
);
end
/////////////////////////////////////////////////////////////////////////
// Gates
/////////////////////////////////////////////////////////////////////////
genvar j;
for ( j=0; j<NUMBER_OF_GATES; j++) 
begin
    ParallelStreamGates #(
      .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
      .NUMBER_OF_INPUT_WIRES(NUMBER_OF_INPUT_WIRES)
    ) gate (
      .clk(clk),
      .resetn(resetn),
      .passThrough(AgentPkg::is_passthrough(configs[j])),
      .validConfigIn(validConfigIn),
      .validConfigOut(validConfigOut[j]),
      .configValue(configs[j]),
      .out(gate_input[j+1]),  
      .passThroughOut(passthrough[j+1]),
      .in(gate_input[j]), 
      .passThroughIn(passthrough[j])
    );
end

endmodule : ParallelStreamingCircuit


`endif