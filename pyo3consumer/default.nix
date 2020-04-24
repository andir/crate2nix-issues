let
  pkgs = import ./nixpkgs.nix;
in (pkgs.callPackage ./Cargo.nix {}).rootCrate.build.lib
