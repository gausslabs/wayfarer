set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/%NAME%" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/%NAME%
    }
}

exec xelab -debug typical -top %NAME%_TB -snapshot %NAME%_tb_snapshot

exec xsim %NAME%_tb_snapshot -R