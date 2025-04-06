`ifndef AXIL_CONFIG
 `define AXIL_CONFIG

module AXILConfigStore #(
    type store_type = AXILitePkg::GateConfigStore,
    type config_type = AgentPkg::GateConfig,
    parameter NUMBER_OF_GATES = AXILitePkg::NUMBER_OF_GATES,
    parameter NUMBER_OF_STAGES = 8, 
    // Addresses are always interms of bytes
    parameter CONFIG_SIZE = AXILitePkg::NUMBER_OF_WORDS,
    parameter START_OFFSET = 32'd0
) (
// Base
  input wire clk,
  input wire resetn,

// Config Ports
  output logic validConfig,
  output logic reset_func,
  output config_type configs [0:NUMBER_OF_GATES - 1],
  input wire done,
  input wire equal,
  input wire [NUMBER_OF_STAGES - 1:0] comparator_outputs,
  input wire [31:0] count,

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

///////////////////////////////////////////////////////////////////////////
// Managing configs
///////////////////////////////////////////////////////////////////////////
store_type data;
genvar i;
for (i=0; i<NUMBER_OF_GATES; i++) begin
    assign configs[i] = data.configValue[i];
end


///////////////////////////////////////////////////////////////////////////
// writing operands
///////////////////////////////////////////////////////////////////////////
localparam TOTAL_REGISTER = CONFIG_SIZE + 2;
logic [$clog2(TOTAL_REGISTER) -1:0] write_addr;
logic mask_disable;
assign axil_awready = 1;

always_ff @ (posedge clk)
begin
if(resetn)
begin
    if(axil_awvalid)
    begin
        mask_disable <= 0;//~(axil_awaddr >= START_OFFSET & (axil_awaddr <= (START_OFFSET + ((TOTAL_REGISTER) <<2))));
        write_addr <= axil_awaddr[2+:$clog2(TOTAL_REGISTER)];
    end
end
else
begin
  mask_disable <= 0;
  write_addr <= 0;
end
end

///////////////////////////////////////////////////////////////////////////
// writing operands
///////////////////////////////////////////////////////////////////////////
assign axil_wready = 1;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (axil_wvalid & (~mask_disable))
  begin
    if (write_addr < CONFIG_SIZE)
        begin
            for ( integer byte_index = 0; byte_index <= 3; byte_index = byte_index+1 )
	            if ( axil_wstrb[byte_index] == 1 ) 
                begin
	              // Respective byte enables are asserted as per write strobes
	              // goes to the right byte in the slave
	              data.data[write_addr][(byte_index*8) +: 8] <= axil_wdata[(byte_index*8) +: 8];
	            end
        end
    else begin
      if (write_addr == CONFIG_SIZE)
      begin
        if (axil_wstrb[0] == 1)
        begin
          validConfig <= axil_wdata[0];
          reset_func <= axil_wdata[1];
        end
      end
    end
  end
end
else
begin
  data.data <= 0;
  validConfig <= 0;
  reset_func <= 0;
end
end

///////////////////////////////////////////////////////////////////////////
// write response
///////////////////////////////////////////////////////////////////////////
typedef enum logic [1:0] { 
  WAITING_FOR_DATA,
  WRITING_DATA,
  SEND_RESP
 } RespState;

RespState current_state, next_state;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  current_state <= next_state;
end
else
begin
  current_state <= WAITING_FOR_DATA;
end
end

always_comb begin
  case (current_state)
    WAITING_FOR_DATA:
      next_state = axil_wvalid ? WRITING_DATA : WAITING_FOR_DATA;
    WRITING_DATA:
      next_state = axil_wvalid ? WRITING_DATA : SEND_RESP;
    SEND_RESP:
      next_state = axil_bready ? WAITING_FOR_DATA : SEND_RESP;
    default: begin
      next_state = WAITING_FOR_DATA;
    end
  endcase
end

assign axil_bresp = 0;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  axil_bvalid <= current_state == SEND_RESP;
end
else
begin
  axil_bvalid <= 0;
end
end


///////////////////////////////////////////////////////////////////////////
// reading operands and result
///////////////////////////////////////////////////////////////////////////
logic [$clog2(TOTAL_REGISTER) - 1:0] read_addr;
logic read_mask_disable, read_enable;
assign axil_arready = 1;

always_ff @ (posedge clk)
begin
if(resetn)
begin
  read_enable <= axil_arvalid;
    if(axil_arvalid)
    begin
        read_mask_disable <= 0;//~(axil_awaddr > START_OFFSET & (axil_awaddr < (START_OFFSET + ((TOTAL_REGISTER) <<2))));
        read_addr <= axil_araddr[2+:$clog2(TOTAL_REGISTER)];
    end
end
else
begin
  read_enable <= 0;
  read_mask_disable <= 0;
  read_addr <= 0;
end
end

///////////////////////////////////////////////////////////////////////////
// reading operands
///////////////////////////////////////////////////////////////////////////
assign axil_rresp = 0;
always_ff @ (posedge clk)
begin
if(resetn)
begin
  if (read_enable)
  begin
     axil_rvalid <= ~read_mask_disable;
     if (read_mask_disable)
      axil_rdata <= 0;
     else
     begin
      if (read_addr < CONFIG_SIZE)
         axil_rdata <= data.data[read_addr];
      else if (read_addr == CONFIG_SIZE) begin
         axil_rdata <= {20*{1'b0},{comparator_outputs,done,equal,reset_func,validConfig}};
      end
      else begin
         axil_rdata <= count;
      end
     end
  end
  else 
  begin
    axil_rdata <= axil_rdata;
    if(axil_rready)
      axil_rvalid <= 0;
    else
      axil_rvalid <= axil_rvalid;
  end
end
else
begin
  axil_rdata <= 0;
  axil_rvalid <= 0;
end
end


endmodule



`endif