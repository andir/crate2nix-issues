let
 nixpkgs = import <nixpkgs> {};
 crate2nix = nixpkgs.callPackage (nixpkgs.fetchFromGitHub {
   owner = "kolloch";
   repo = "crate2nix";
   rev = "5b19c1b14e1b0e5522c3e44e300d0b332dc939e7";
   sha256 = "0j5cnzxbikv9zxw50vcbzndg3kzacjk7a05m3sph5jk7yrxsk7s5";
 }) {};
in nixpkgs.mkShell {
  buildInputs = [ crate2nix ];
}
