load(":rtl.bzl", "lint_rtl", "vivado_sim_proj")

lint_rtl(
  name = "lint_rtl",
  top = "swap_5",
  include_dirs = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated"],
)

vivado_sim_proj(
  name = "sim_fifo",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/FIFO/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/FIFO"],
  top_module = "FIFO_TB",
  hex_files = ["fifo.hex"]
)

vivado_sim_proj(
  name = "sim_ref_circuit",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/StreamingReferenceCircuit/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/StreamingReferenceCircuit"],
  top_module = "ReferenceCircuit_TB",
  hex_files = ["streamInput.hex","config.hex","referenceStream.hex","gateStream.hex"]
)

vivado_sim_proj(
  name = "sim_search_circuit",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/StreamingSearchCircuit/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/StreamingSearchCircuit"],
  top_module = "SearchCircuit_TB",
  hex_files = ["streamInput.hex","config.hex","referenceStream.hex","searchStream.hex"]
)

vivado_sim_proj(
  name = "simple_collision_test",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "RowCollisionCheck_TB",
  hex_files = []
)

vivado_sim_proj(
  name = "Permute_5",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/Permute_5/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/Permute_5"],
  top_module = "Permute_5_TB",
  hex_files = ["streamInput.hex","config.hex","referenceStream.hex"]
)