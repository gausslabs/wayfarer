set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/GateLayer"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/GateLayer
    }
}

exec xelab -debug typical -top GateLayer_TB -snapshot GateLayer_tb_snapshot

exec xsim GateLayer_tb_snapshot -R