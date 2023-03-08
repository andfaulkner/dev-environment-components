#============================= CREATING PROJECTS =============================#
# To create a new Rust project:
cargo new project_name

# This will create a project in the given directory, with:
#   1. A Cargo.toml file (akin to package.json); and
#   2. A src folder for source code.

# To create a new Rust project initialized as a git repo, with a sane gitignore file:
cargo new --vcs=git project_name


#============================= BUILDING PROJECTS =============================#
# Run this at the project root to perform a basic build
cargo build
# Executable will be outputted to ./target/debug/project_name

# Perform a release build with:
cargo build --release
# Executable will be emitted to ./target/release/project_name


#============================= RUNNING PROJECTS ==============================#
# Build and run a project by running this at the project root:
cargo run


#========================== CHECKING PROJECT SYNTAX ==========================#
# Confirm that a Rust project can compile (without compiling) with:
cargo check


#=============================== DEPENDENCIES ================================#
