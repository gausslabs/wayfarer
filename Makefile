lint:
	vivado -mode batch -source Scripts/Lint.tcl
	rm *.jou *.log

model-test:
	bazel run //Models/lfsr/lfsr-lib:lfsr_library_test

clean-bazel:
	rm -rf bazel-*

sw-model-test: model-test clean-bazel