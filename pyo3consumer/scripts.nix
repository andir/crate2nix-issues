let
  pkgs = import ./nixpkgs.nix;

  env = pkgs.stdenv.lib.makeBinPath [ pkgs.crate2nix pkgs.nix pkgs.less ];
in {
  re = pkgs.writeShellScriptBin "re" ''
    export PAGER=""
    PATH=${env}
    set -ex
    crate2nix generate
    OUT=$(nix-build)
    echo $OUT
    nix why-depends $OUT ${pkgs.rustNightly}
  '';
}
