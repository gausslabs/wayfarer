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

`endif