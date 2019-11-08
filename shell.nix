let
  nixpkgs = import <nixpkgs> {};
 crate2nix = nixpkgs.callPackage (nixpkgs.fetchFromGitHub {
   owner = "kolloch";
   repo = "crate2nix";
   rev = "f3bac5fcc0d88dda9f060e885028f73a42857a33";
   sha256 = "02cc3pg1y9a73w3knb2x6zrrivq39kb66pfz4ivsi10g6mkyczgh";
 }) {};
in nixpkgs.mkShell {
  buildInputs = [ crate2nix ];
}
