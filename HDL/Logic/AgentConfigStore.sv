`ifndef AGENT_CONFIG_STORE
 `define AGENT_CONFIG_STORE

//                                         Data Store 
//                                       ┌───────────┐
//                                       │            
//                        ┌─────┐        │           │
//                        │     ┼────────►           │
//                        │Addr │        ┌───────────┼
// ────┐[Data,Valid]──────►Mux  │        │           │
//     │                  │     │        │           │
//     │                  │     │        │           │
//     │                  │     │        ┼───────────┼
//     │                  └──▲──┘        │     │     │
//     │                     │           │           │
//     │                     │           │     │     │
//     │                     │           │           │
//     │        ┌───────┐    │           │     │     │
//     └──Valid─►Counter│    │           ┼───────────┼
//              │       ┼────┘           │           │
//              │       │                │           │
//              └───────┘                └───────────┘

module ReferenceConfigExtraction #(
    type type_of_store = AgentPkg::GateConfigStore,
    type input_data_type = StreamSelectionPkg::AgentConfig,
    parameter ADDR_SIZE = AgentPkg::GATE_CONFIG_COUNT_SIZE
)(
  input  wire       clk,
  input  wire       resetn,
  output logic      validOut,
  output type_of_store out,
  AXI4S.Slave       in 
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
logic [ADDR_SIZE -1 :0] addr;
input_data_type inData;
assign in.ready = resetn;
assign inData = in.data;

Counter #(
  .COUNTER_WIDTH(ADDR_SIZE)
) address_counter (
  .clk(clk),
  .resetn(resetn),
  .enable(in.valid),
  .count(addr)
);

/////////////////////////////////////////////////////////////////
// values beign stored
/////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  // When values are being loaded the config is in valid
  validOut <= ~in.valid;
  if (in.valid)
    out.data[addr] <= inData.data;
end
else
begin
  validOut <= 0;
end
end


endmodule

module Counter #(
  parameter COUNTER_WIDTH = 8
) (
  input wire clk,
  input wire resetn,
  input wire enable,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (enable)
    counter <= counter + 1;
end
else
begin
  counter <= 0;
end
end

assign count = counter[COUNTER_WIDTH - 1:0];


endmodule

// This only fills the exact number of storage sections
// before rolling over.
//                                         Data Store 
//                                       ┌───────────┐
//                                       │            
//                        ┌─────┐        │           │
//                        │     ┼────────►           │
//                        │Addr │        ┌───────────┼
// ────┐[Data,Valid]──────►Mux  │        │           │
//     │                  │     │        │           │
//     │                  │     │        │           │
//     │                  │     │        ┼───────────┼
//     │                  └──▲──┘        │     │     │
//     │                     │           │           │
//     │                     │           │     │     │
//     │                     │           │           │
//     │        ┌───────┐    │           │     │     │
//     └──Valid─►Counter│    │           ┼───────────┼
//              │With   ┼────┘           │           │
//              │Limit  │                │           │
//              └───────┘                └───────────┘

module ConfigExtraction #(
    type type_of_store = ShufflePkg::WireMatrixStore,
    type input_data_type = StreamSelectionPkg::AgentConfig,
    parameter DATA_COUNT = ShufflePkg::WIRE_MATRIX_SIZE_IN_BYTES
)(
  input  wire       clk,
  input  wire       resetn,
  output logic      validOut,
  output type_of_store out,
  AXI4S.Slave       in 
);
/////////////////////////////////////////////////////////////////
// internal values
/////////////////////////////////////////////////////////////////
localparam ADDR_SIZE = $clog2(DATA_COUNT);
logic [ADDR_SIZE -1 :0] addr;
input_data_type inData;
assign in.ready = resetn;
assign inData = in.data;

CounterWithLimit #(
  .COUNTER_WIDTH(ADDR_SIZE),
  .LIMIT(DATA_COUNT)
) address_counter (
  .clk(clk),
  .resetn(resetn),
  .enable(in.valid),
  .count(addr)
);

/////////////////////////////////////////////////////////////////
// values beign stored
/////////////////////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  // When values are being loaded the config is in valid
  validOut <= ~in.valid;
  if (in.valid)
    out.data[addr] <= inData.data;
end
else
begin
  validOut <= 0;
end
end


endmodule

module CounterWithLimit #(
  parameter COUNTER_WIDTH = 8,
  parameter LIMIT = 10
) (
  input wire clk,
  input wire resetn,
  input wire enable,
  output logic [COUNTER_WIDTH - 1:0] count
);

logic [COUNTER_WIDTH :0] counter, next_count;
assign next_count = counter + 1;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (enable)
  begin
    if (next_count < LIMIT)
      counter <= next_count;
    else
      counter <= 0;
  end
end
else
begin
  counter <= 0;
end
end

assign count = counter[COUNTER_WIDTH - 1:0];


endmodule

`endif
