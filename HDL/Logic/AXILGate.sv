`ifndef AXIL_GATE
 `define AXIL_GATE

module AXILGate #(
  parameter ENABLE_ILA = 0
)(
  input wire clk,
  input wire resetn,
 // Axi ports

  input  logic  [31:0]  axil_awaddr,
  input  logic  [54:0]  axil_awuser,
  input  logic          axil_awvalid,
  output logic          axil_awready,

  input  logic  [31:0]  axil_wdata,
  input  logic   [3:0]  axil_wstrb,
  input  logic          axil_wvalid,
  output logic          axil_wready,

  output logic   [1:0]  axil_bresp,
  output logic          axil_bvalid,
  input  logic          axil_bready,

  input  logic  [31:0]  axil_araddr,
  input  logic  [54:0]  axil_aruser,
  input  logic          axil_arvalid,
  output logic          axil_arready,

  output logic  [31:0]  axil_rdata,
  output logic   [1:0]  axil_rresp,
  output logic          axil_rvalid,
  input  logic          axil_rready
);
/////////////////////////////////////////////////////////////////////////
// internal nets
/////////////////////////////////////////////////////////////////////////
localparam NUMBER_OF_GATES = AXILitePkg::NUMBER_OF_GATES;
localparam NUMBER_OF_STAGES = 8;
localparam TOTAL_WIDTH = 11;
localparam DATA_WIDTH = TOTAL_WIDTH - $clog2(NUMBER_OF_STAGES);

AgentPkg::GateConfig configs [0:NUMBER_OF_GATES - 1];
logic validConfig, reset_func, done, equal;
logic [0:NUMBER_OF_GATES - 1] config_loaded;
logic [NUMBER_OF_STAGES - 1:0] counters_done;
logic [NUMBER_OF_STAGES - 1:0] comparator_output;
logic [NUMBER_OF_STAGES - 1:0] gate_inp_valids, source_valids;
logic [31:0] count;

assign done = &counters_done;
assign equal = &comparator_output;

AXI4S #(.DATA_WIDTH(TOTAL_WIDTH)) source [0:NUMBER_OF_STAGES -1]();
AXI4S #(.DATA_WIDTH(TOTAL_WIDTH)) gate_input [0:NUMBER_OF_GATES] [0:NUMBER_OF_STAGES -1]();
AXI4S #(.DATA_WIDTH(TOTAL_WIDTH)) passthrough [0:NUMBER_OF_GATES] [0:NUMBER_OF_STAGES -1]();
/////////////////////////////////////////////////////////////////////////
// config slave
/////////////////////////////////////////////////////////////////////////
AXILConfigStore #(
    .store_type(AXILitePkg::GateConfigStore),
    .config_type(AgentPkg::GateConfig),
    .NUMBER_OF_GATES(NUMBER_OF_GATES),
    .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
    // Addresses are always interms of bytes
    .CONFIG_SIZE(AXILitePkg::NUMBER_OF_WORDS),
    .START_OFFSET(32'd0)
) config_store (
// Base
  .clk(clk),
  .resetn(resetn),

// Config Ports
  .validConfig(validConfig),
  .reset_func(reset_func),
  .configs(configs),
  .done(done),
  .equal(equal),
  .comparator_outputs(comparator_output),
  .count(count),

// Axi ports

  .axil_awaddr(axil_awaddr),
  .axil_awuser(axil_awuser),
  .axil_awvalid(axil_awvalid),
  .axil_awready(axil_awready),

  .axil_wdata(axil_wdata),
  .axil_wstrb(axil_wstrb),
  .axil_wvalid(axil_wvalid),
  .axil_wready(axil_wready),

  .axil_bresp(axil_bresp),
  .axil_bvalid(axil_bvalid),
  .axil_bready(axil_bready),

  .axil_araddr(axil_araddr),
  .axil_aruser(axil_aruser),
  .axil_arvalid(axil_arvalid),
  .axil_arready(axil_arready),

  .axil_rdata(axil_rdata),
  .axil_rresp(axil_rresp),
  .axil_rvalid(axil_rvalid),
  .axil_rready(axil_rready)
);

/////////////////////////////////////////////////////////////////////////
// Counter sources
/////////////////////////////////////////////////////////////////////////

genvar i;
for ( i=0; i<NUMBER_OF_STAGES; i++) 
begin
  assign source_valids[i] = source[i].valid;
    AXISCounterWithMask #(
      .TOTAL_WIDTH(TOTAL_WIDTH),
      .MASK(i),
      .DATA_WIDTH(DATA_WIDTH)
    ) source_counter (
      .clk(clk),
      .resetn(resetn & reset_func & (&config_loaded)),
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
// Gates
/////////////////////////////////////////////////////////////////////////

genvar j;
for ( j=0; j<NUMBER_OF_GATES; j++) 
begin
    ParallelStreamGates #(
      .NUMBER_OF_STAGES(NUMBER_OF_STAGES),
      .NUMBER_OF_INPUT_WIRES(TOTAL_WIDTH)
    ) gate (
      .clk(clk),
      .resetn(resetn),
      .passThrough(AgentPkg::is_passthrough(configs[j])),
      .validConfigIn(validConfig),
      .validConfigOut(config_loaded[j]),
      .configValue(configs[j]),
      .out(gate_input[j+1]),  
      .passThroughOut(passthrough[j+1]),
      .in(gate_input[j]), 
      .passThroughIn(passthrough[j])
    );
end

/////////////////////////////////////////////////////////////////////////
// Comparators
/////////////////////////////////////////////////////////////////////////


genvar k;
for ( k=0; k<NUMBER_OF_STAGES; k++) 
begin

assign gate_inp_valids[k] = gate_input[NUMBER_OF_GATES][k].valid & passthrough[NUMBER_OF_GATES][k].valid;

AXISComparatorNoReadyHandling #(
  .NAME($sformatf("Input: %0d", k))
) comparator (
  .clk(clk),
  .resetn(resetn & reset_func & (&config_loaded)),
  .in1(gate_input[NUMBER_OF_GATES][k]),
  .in2(passthrough[NUMBER_OF_GATES][k]),
  .lastReached(),
  .equal(comparator_output[k])
);
end


SimpleCounter #(
  .COUNTER_WIDTH(32)
) sample_pass_count (
  .clk(clk),
  .resetn(resetn & reset_func & (&config_loaded)),
  .enable((&comparator_output) & (&gate_inp_valids) ),
  .count(count)
);


/////////////////////////////////////////////////////////////////////////
// Degub ILA
/////////////////////////////////////////////////////////////////////////
if (ENABLE_ILA == 1)
begin
   ila_1 CL_GATE_ILA_0 (
                   .clk    (clk),
                   .probe0 (done),
                   .probe1 (equal),
                   .probe2 (config_loaded),
                   .probe3 (0),
                   .probe4 (0),
                   .probe5 (0),
                   .probe6 (0),
                   .probe7 (0),
                   .probe8 (1'b0),
                   .probe9 (1'b0),
                   .probe10 (0),
                   .probe11 (1'b0),
                   .probe12 (0),
                   .probe13 (2'b0),
                   .probe14 (0),
                   .probe15 (0),
                   .probe16 (0),
                   .probe17 (3'b0),
                   .probe18 (3'b0),
                   .probe19 (0),
                   .probe20 (0),
                   .probe21 (0),
                   .probe22 (0),
                   .probe23 (3'b0),
                   .probe24 (0),
                   .probe25 (0),
                   .probe26 (0),
                   .probe27 (0),
                   .probe28 (3'b0),
                   .probe29 (0),
                   .probe30 (gate_input[NUMBER_OF_GATES][0].valid),
                   .probe31 (gate_input[NUMBER_OF_GATES][0].data[3:0]),
                   .probe32 (gate_input[NUMBER_OF_GATES][0].data[7:4]),
                   .probe33 (passthrough[NUMBER_OF_GATES][0].data[3:0]),
                   .probe34 (passthrough[NUMBER_OF_GATES][0].data[7:4]),
                   .probe35 (passthrough[NUMBER_OF_GATES][0].valid),
                   .probe36 (source_valids[3:0]),
                   .probe37 (source_valids[7:4]),
                   .probe38 (0),
                   .probe39 (0),
                   .probe40 (1'b0),
                   .probe41 (1'b0),
                   .probe42 (1'b0),
                   .probe43 (1'b0)
                   );
end

endmodule

`endif