load("@rules_rust//rust:defs.bzl", "rust_binary")

rust_binary(
    name = "gate_layer_model",
    
    # Specifies the source file for the binary.
    srcs = ["src/main.rs"],
    
    # Specifies dependencies for the binary.
    deps = [
        "//Models/utilities:utilities"
    ],
    edition = "2021"
)