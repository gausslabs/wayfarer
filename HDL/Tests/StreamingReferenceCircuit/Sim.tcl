set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/StreamingReferenceCircuit"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/StreamingReferenceCircuit
    }
}

exec xelab -debug typical -top ReferenceCircuit_TB -snapshot StreamingReferenceCircuit_tb_snapshot

exec xsim StreamingReferenceCircuit_tb_snapshot -R