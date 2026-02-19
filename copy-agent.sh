#!/bin/bash
[[ -v SOURCE_DIR ]] && echo "Setting default sources"; SOURCE_DIR=./HDL


[[ -v DESTINATION_DIR ]] && echo "Setting default sources"; DESTINATION_DIR=~/phantom/playground/my-aws-fpga/hdk/cl/examples/cl_agent/design


# [[ -v FILE_LIST ]] && echo "Setting default sources"; FILE_LIST="/Logic/Counters.sv  /Logic/ConfigDistributor.sv /Logic/GateSearchLayer.sv /Logic/WirePermutation.sv /Logic/Toffoli.sv"

cp $SOURCE_DIR/Types/*.sv $DESTINATION_DIR
cp $SOURCE_DIR/Logic/*.sv $DESTINATION_DIR

