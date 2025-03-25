set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/ParallelReferenceCircuit"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/ParallelReferenceCircuit
    }
}

exec xelab -debug typical -top ParallelReferenceCircuit_TB -snapshot ParallelReferenceCircuit_tb_snapshot

exec xsim ParallelReferenceCircuit_tb_snapshot -R