set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/FIFO" "./HDL/Genrated" ];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/FIFO -i ./HDL/Genrated
    }
}

exec xelab -debug typical -top FIFO_TB -snapshot fifo_tb_snapshot

exec xsim fifo_tb_snapshot -R