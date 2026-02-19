set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/PRNG"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/PRNG
    }
}

exec xelab -debug typical -top PRNG_TB -snapshot prng_tb_snapshot

exec xsim prng_tb_snapshot -R