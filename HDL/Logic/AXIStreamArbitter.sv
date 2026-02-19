`ifndef AXI_STREAM_ARBITER
 `define AXI_STREAM_ARBITER


module AXISArbiter3 (
  input wire clk,
  input wire resetn,
  AXI4S.Master out [2:0],
  AXI4S.Slave in
);
///////////////////////////////////////////////////
// Abitration
///////////////////////////////////////////////////
logic [2:0] req, grant;

Arbiter3 arbiter (
 .clk(clk),
 .resetn(resetn),
 .req(req),
 .grant(grant)
);

assign req = {(out[2].ready & in.valid), (out[1].ready & in.valid), (out[0].ready & in.valid)};

///////////////////////////////////////////////////
// Data flow
///////////////////////////////////////////////////
always_ff @ (posedge clk)
begin
if(resetn)
begin
  case (grant)
    3'b001:
    begin
        out[0].valid <= in.valid;
        out[0].data <= in.data;
        out[1].valid <= 0;
        out[1].data <= 0;
        out[2].valid <= 0;
        out[2].data <= 0;
    end
    3'b010:
    begin
        out[1].valid <= in.valid;
        out[1].data <= in.data;
        out[0].valid <= 0;
        out[0].data <= 0;
        out[2].valid <= 0;
        out[2].data <= 0;
    end
    3'b100:
    begin
        out[2].valid <= in.valid;
        out[2].data <= in.data;
        out[1].valid <= 0;
        out[1].data <= 0;
        out[0].valid <= 0;
        out[0].data <= 0;
    end
    default: begin
        out[0].valid <= 0;
        out[0].data <= 0;
        out[1].valid <= 0;
        out[1].data <= 0;
        out[2].valid <= 0;
        out[2].data <= 0;
    end
  endcase
end
else
begin
  out[0].valid <= 0;
  out[0].data <= 0;
  out[1].valid <= 0;
  out[1].data <= 0;
  out[2].valid <= 0;
  out[2].data <= 0;
end
end

assign in.ready = out[2].ready | out[1].ready | out[0].ready;

endmodule

`endif