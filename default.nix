{ pkgs ? import ./nixpkgs.nix }:
{
  reqwest = (pkgs.callPackage ./reqwest-test/Cargo.nix {}).rootCrate.build;
}
