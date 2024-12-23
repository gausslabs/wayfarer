set src_dirs [list "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/RecorderAndPlayer" "./HDL/Genrated" ];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/RecorderAndPlayer -i ./HDL/Genrated
    }
}

exec xelab -debug typical -top RecorderAndPlayer_TB -snapshot recorderplayer_tb_snapshot

exec xsim recorderplayer_tb_snapshot -R