set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/LFSR"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/LFSR
    }
}

exec xelab -debug typical -top LFSR_TB -snapshot lfsr_tb_snapshot

exec xsim lfsr_tb_snapshot -R