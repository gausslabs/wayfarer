load(":rtl.bzl", "lint_rtl", "vivado_sim_proj")

lint_rtl(
  name = "lint_rtl",
  top = "AXILAgent",
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
  name = "TreeAdder_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "TreeAdder_TB",
  hex_files = []
)

vivado_sim_proj(
  name = "Mod11_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "Mod11_TB",
  hex_files = []
)

vivado_sim_proj(
  name = "SafeWire_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "SafeWire_TB",
  hex_files = []
)

vivado_sim_proj(
  name = "LFSRMod11_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/LFSRMod11/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/LFSRMod11"],
  top_module = "LFSRMod11_TB",
  hex_files = ["referenceStream.hex"]
)

vivado_sim_proj(
  name = "Permute_5",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/Permute_5/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/Permute_5"],
  top_module = "Permute_5_TB",
  hex_files = ["streamInput.hex","config.hex","referenceStream.hex"]
)

vivado_sim_proj(
  name = "Permute_10",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/Permute_10/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/Permute_10"],
  top_module = "Permute_10_TB",
  hex_files = ["streamInput.hex","config.hex","referenceStream.hex"]
)

vivado_sim_proj(
  name = "ShuffleData",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/ShuffleData/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/ShuffleData"],
  top_module = "ShuffleData_TB",
  hex_files = ["streamInput.hex","referenceStream.hex"]
)

vivado_sim_proj(
  name = "ShuffleDataWithCollision",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/ShuffleDataWithCollision/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/ShuffleDataWithCollision"],
  top_module = "ShuffleDataWithCollision_TB",
  hex_files = ["streamInput.hex", "collision.hex","referenceStream.hex"]
)

vivado_sim_proj(
  name = "FullShuffle_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "FullShuffle_TB",
  hex_files = []
)

vivado_sim_proj(
  name = "Shuffle_Agent_TB",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/SimpleTests/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/SimpleTests"],
  top_module = "Shuffle_Agent_TB",
  hex_files = []
)
