set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/ParallelStreamingGate"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/ParallelStreamingGate
    }
}

exec xelab -debug typical -top ParallelStreamingGate_TB -snapshot ParallelStreamingGate_tb_snapshot

exec xsim ParallelStreamingGate_tb_snapshot -R