pyo3 when built through buildRustCrate carries a reference to the compiler and
the compilers source code. That shouldn't be.

To reproduce run `nix-shell` and then just run `re` whenever you want to do a
test build. The file `rustc-flags.txt` contains additional rustc flags that
will be passed to rustc during compilation.
