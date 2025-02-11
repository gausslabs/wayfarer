load("@rules_rust//rust:defs.bzl", "rust_library")

rust_library(
    name = "utilities",
    
    # Specifies the source files for the library.
    srcs = glob(["src/*.rs"]),
    crate_root = "src/lib.rs",
    
    visibility = ["//:__subpackages__"],

    edition = "2021"
    
)

