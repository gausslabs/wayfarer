set_part xc7a35tcpg236-1
read_verilog -sv [glob ./HDL/*.sv]
synth_design -top Toffoli  -lint
