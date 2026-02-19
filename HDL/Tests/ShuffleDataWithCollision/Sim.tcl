set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/ShuffleDataWithCollision" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/ShuffleDataWithCollision
    }
}

exec xelab -debug typical -top ShuffleDataWithCollision_TB -snapshot ShuffleDataWithCollision_tb_snapshot

exec xsim ShuffleDataWithCollision_tb_snapshot -R