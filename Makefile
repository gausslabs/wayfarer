lint:
	vivado -mode batch -source Scripts/Lint.tcl
	rm *.jou *.log

model-test:
	bazel run //Models/lfsr/lfsr-lib:lfsr_library_test

clean-bazel:
	rm -rf bazel-*

sw-model-test: model-test clean-bazel

clean-run:
	rm -r *.log *.jou *.pb *.wdb *.vcd xsim.dir/

clean: clean-run clean-bazel

run-test:
	vivado -mode batch -source HDL/Tests/${TEST_NAME}/Sim.tcl

test-setup:
	mkdir HDL/Tests/${TEST_NAME}
	touch HDL/Tests/${TEST_NAME}/${TEST_NAME}_TB.sv
	touch HDL/Tests/${TEST_NAME}/${TEST_NAME}Wrapper.sv
	touch HDL/Tests/${TEST_NAME}/Sim.tcl

lfsr-emit:
	bazel run //Models/lfsr:lfsr_model -- /tmp/input.hex 63