`ifndef CONFIG_DISTRIBUTOR
 `define CONFIG_DISTRIBUTOR

//                                    ┌──────────────┐
//         ┌───────┐                  │Config->      │
//         │       ┼──────────────────►              │
//         │Config │                  │              │
//  Config─► Reg   ┼───────────┐      └──────────────┘
//         │       │           │
//         │       ┼────────┐  │      ┌──────────────┐
//         └───────┘        │  │      │Config->      │
//                          │  └──────►              │
//                          │         │              │
//                          │         └──────────────┘
//                          │
//                          │         ┌──────────────┐
//                          │         │Config->      │
//                          └─────────►              │
//                                    │              │
//                                    └──────────────┘

module ConfigDistributor #(
  type type_of_config = AgentPkg::GateConfig,
  parameter NUMBER_OF_STAGES = 8
) (
  input wire clk,
  input wire resetn,
  input wire validIn,
  input type_of_config store,
  output logic validOut,
  output type_of_config configValue [NUMBER_OF_STAGES - 1: 0]
);

/////////////////////////////////////////////////////////////////
// Local nets
/////////////////////////////////////////////////////////////////
type_of_config internal_store;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  validOut <= validIn;
  internal_store <= store;
end
else
begin
  validOut <= 0;
  internal_store <= 0;
end
end

/////////////////////////////////////////////////////////////////
// Distribution of config
/////////////////////////////////////////////////////////////////
genvar i;

for (i=0; i<NUMBER_OF_STAGES; i++) begin
    assign configValue[i] = internal_store;
end

endmodule


`endif