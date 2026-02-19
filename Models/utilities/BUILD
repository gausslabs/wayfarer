load("@rules_rust//rust:defs.bzl", "rust_library")
load("@rules_rust//crate_universe:defs.bzl", "all_crate_deps")

rust_library(
    name = "utilities",
    
    # Specifies the source files for the library.
    srcs = glob(["src/*.rs"]),
    crate_root = "src/lib.rs",
    
    visibility = ["//:__subpackages__"],

    deps = all_crate_deps(),

    edition = "2021"
    
)

