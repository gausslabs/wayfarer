set_part xc7a35tcpg236-1
#  [glob ./HDL/*/*.sv]
# read_verilog -sv [glob ./HDL/Tests/Infra/*.sv]
set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" ];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        read_verilog -sv $file
    }
}
synth_design -top AXISSource -include_dirs $src_dirs  -lint
