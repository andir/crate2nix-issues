let
  pkgs = import ./nixpkgs.nix;
  scripts = import ./scripts.nix;
in pkgs.mkShell {
  buildInputs = [
    pkgs.rustNightly
    pkgs.crate2nix
    pkgs.python3
  ] ++ (builtins.attrValues scripts);
}
