load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library")

rust_library(
    name = "gate_internals",
    
    # Specifies the source files for the library.
    srcs = ["src/gate-internals/lib.rs"],
    
    visibility = ["//:__subpackages__"],

    edition = "2021"
    
)

rust_binary(
    name = "gate_layer_model",
    
    # Specifies the source file for the binary.
    srcs = ["src/main.rs"],
    
    # Specifies dependencies for the binary.
    deps = [
        ":gate_internals"
    ],
    edition = "2021"
)