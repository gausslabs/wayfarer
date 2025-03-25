set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/Permute_5" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/Permute_5
    }
}

exec xelab -debug typical -top SearchCircuit_TB -snapshot Permute_5_tb_snapshot

exec xsim Permute_5_tb_snapshot -R