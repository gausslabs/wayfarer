set_part {PART}
set src_dirs [list {DIRS} ];

foreach i $src_dirs {
    foreach file [glob -nocomplain -directory $i *.sv] {
        read_verilog -sv $file
    }
}
synth_design -top {TOP} -include_dirs $src_dirs  -lint