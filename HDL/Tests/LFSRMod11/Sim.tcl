set src_dirs [list "./HDL/Types" "./HDL/Logic" "./HDL/Tests/Infra" "./HDL/Tests/LFSRMod11" "./HDL/Generated"];

foreach i $src_dirs {
    foreach file [glob -directory $i *.sv] {
        exec xvlog -sv $file -i ./HDL/Types  -i ./HDL/Logic -i ./HDL/Tests/Infra -i ./HDL/Tests/LFSRMod11
    }
}

exec xelab -debug typical -top LFSRMod11_TB -snapshot LFSRMod11_tb_snapshot

exec xsim LFSRMod11_tb_snapshot -R