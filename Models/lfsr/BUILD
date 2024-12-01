load("@rules_rust//rust:defs.bzl", "rust_binary")

# Declares a Rust binary target with the given name.
rust_binary(
    name = "lfsr_model",
    
    # Specifies the source file for the binary.
    srcs = ["src/main.rs"],
    
    # Specifies dependencies for the binary.
    deps = [
        # Depend on the `substring_library` target, which is the crate you created.
        '//Models/lfsr/lfsr-lib:lfsr_library'
    ],
    edition = "2021"
)