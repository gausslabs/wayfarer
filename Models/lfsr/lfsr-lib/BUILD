load("@rules_rust//rust:defs.bzl", "rust_library", "rust_test")

# Declares a Rust library target with the given name.
rust_library(
    name = "lfsr_library",
    
    # Specifies the source files for the library.
    srcs = ["src/lib.rs"],
    
    visibility = ["//:__subpackages__"],

    edition = "2021"
    
)

# Declares a Rust test target with the given name.
rust_test(
    name = "lfsr_library_test",
    
    # Specifies the source file for the test.
    srcs = ["src/lib.rs"],
    
    # Specifies dependencies for the test.
    deps = [
        # Depend on the library we just declared.
        ":lfsr_library",
    ],
    
    edition = "2021"
    
)