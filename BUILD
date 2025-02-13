load(":rtl.bzl", "lint_rtl", "vivado_sim_proj")

lint_rtl(
  name = "lint_rtl",
  top = "Gate",
  include_dirs = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated"],
)

vivado_sim_proj(
  name = "sim_fifo",
  srcs = glob(["HDL/Types/*.sv", "HDL/Logic/*.sv", "HDL/Tests/Infra/*.sv", "HDL/Generated/*.sv", "HDL/Tests/FIFO/*.sv"]),
  includes = ["./HDL/Types", "./HDL/Logic", "./HDL/Tests/Infra", "./HDL/Generated", "./HDL/Tests/FIFO"],
  top_module = "FIFO_TB",
  hex_files = ["fifo.hex"]
)