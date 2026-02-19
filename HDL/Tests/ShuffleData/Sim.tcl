set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/ShuffleData" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/ShuffleData
    }
}

exec xelab -debug typical -top ShuffleData_TB -snapshot ShuffleData_tb_snapshot

exec xsim ShuffleData_tb_snapshot -R