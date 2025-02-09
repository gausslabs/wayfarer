set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/StreamingGateLayer"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/StreamingGateLayer
    }
}

exec xelab -debug typical -top StreamingGateLayer_TB -snapshot StreamingGateLayer_tb_snapshot

exec xsim StreamingGateLayer_tb_snapshot -R