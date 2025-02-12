set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/StreamingConfig"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/StreamingConfig
    }
}

exec xelab -debug typical -top StreamingConfig_TB -snapshot StreamingConfig_tb_snapshot

exec xsim StreamingConfig_tb_snapshot -R