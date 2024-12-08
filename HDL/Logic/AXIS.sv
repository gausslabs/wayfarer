`ifndef AXI4_STREAM_SV
 `define AXI4_STREAM_SV

interface AXI4S;
    parameter DATA_WIDTH = 32;
    parameter KEEP_WIDTH = (DATA_WIDTH + 7)/8;

    logic valid;
    logic ready;
    logic [DATA_WIDTH - 1:0]data;
    logic [KEEP_WIDTH - 1:0] keep;
    logic last;

    modport Slave (
        input valid, data, keep, last,
        output ready
    );

    modport Master (
        output valid, data, keep, last,
        input ready
    );

endinterface

module Passthrough (
  input wire clk,
  input wire resetn,
  AXI4S.Master out,
  AXI4S.Slave in
);

always_ff @ (posedge clk)
begin
if(resetn)
begin
    if(out.ready)
    begin
        out.valid <= in.valid;
        out.data  <= in.data;
        out.keep  <= in.keep;
        out.last  <= in.last;
    end
end
else
begin
  out.valid <= 0;
  out.data <= 0;
  out.keep <= 0;
  out.last <= 0;
end
end

assign in.ready = out.ready;

endmodule

`endif