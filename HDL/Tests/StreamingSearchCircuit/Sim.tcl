set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/StreamingSearchCircuit" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/StreamingSearchCircuit
    }
}

exec xelab -debug typical -top SearchCircuit_TB -snapshot StreamingSearchCircuit_tb_snapshot

exec xsim StreamingSearchCircuit_tb_snapshot -R