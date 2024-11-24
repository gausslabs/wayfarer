set_part xc7a35tcpg236-1
read_verilog -sv [glob ./HDL/*/*.sv]
read_verilog -sv [glob ./HDL/Tests/Infra/*.sv]
synth_design -top AXISSource  -lint
