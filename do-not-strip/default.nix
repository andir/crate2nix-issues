{ nixpkgs ? <nixpkgs>, strip ? true }:
let
  pkgs = import nixpkgs {};

  buildRustCrate = if strip then pkgs.buildRustCrate else (args: pkgs.buildRustCrate (args // {
    dontStrip = true;
  }));

  cargo = pkgs.callPackage ./Cargo.nix {
    inherit buildRustCrate;
  };
in cargo.rootCrate.build
