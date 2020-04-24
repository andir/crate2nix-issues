let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    overlays = [
      (import (sources.nixpkgs-mozilla))
    ];
  };
  rustNightlyChannel = pkgs.rustChannelOf {
    date = "2020-04-21";
    channel = "nightly";
    sha256 = "1ffhardy4xqs3h49wwlbry2hgl0qjfd1kza9bsrk92xvb25yaw2x";
  };

  rustNightly = rustNightlyChannel.rust.override {
    extensions = [
      "rust-src"
      "rust-std"
    ];
  };

  crate2nix = pkgs.callPackage (sources.crate2nix) {};
  customBuildRustCrate = (pkgs.buildRustCrate.override {
      rustc = rustNightly;
      defaultCrateOverrides = pkgs.defaultCrateOverrides // {
        pyo3 = old: {
          buildInputs = [ pkgs.python36 ];
        };
      };
    });
in
pkgs.extend (
  _: _: {
    inherit rustNightly crate2nix;
    buildRustCrate = args: (customBuildRustCrate args).overrideAttrs (_: {
      EXTRA_RUSTC_FLAGS=builtins.readFile ./rustc-flags.txt;
    });
  }
)
