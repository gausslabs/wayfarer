load("@rules_rust//rust:repositories.bzl", "rust_register_toolchains")
rust_register_toolchains(
    versions=["1.81.0"],
    
    # Specifies the Rust edition to use for the registered toolchains
)
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# ------------------------------
# Set up rules_rust
# ------------------------------
# http_archive(
#     name = "rules_rust",
#     url = "https://github.com/bazelbuild/rules_rust/archive/refs/tags/0.28.0.tar.gz",
#     strip_prefix = "rules_rust-0.28.0",
#     sha256 = "8ce14a6b10bdfb767958e19f5c85ddc9dc0e6afde91f77ab0d2b0f34417bba4b",
# )

# load("@rules_rust//rust:repositories.bzl", "rust_repositories")
# rust_repositories()

# load("@crate__rand_core//:repositories.bzl", "cargo_raze_repositories")
# cargo_raze_repositories()