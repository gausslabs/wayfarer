`ifndef AXIL_GATE
 `define AXIL_GATE

module AXILGate (
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
logic [31:0] count;

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

    Tee tee_junction (
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
AXISComparator comparator (
  .clk(clk),
  .resetn(resetn),
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
  .enable(&comparator_output),
  .count(count)
);

endmodule

`endif