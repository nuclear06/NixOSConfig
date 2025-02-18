{
  inputs,
  pkgs,
  nixpkgs-stable,
  system,
  ...
}: let
  overlays = builtins.map (
    f: (import (./. + "/${f}") {
      inherit
        inputs
        pkgs
        nixpkgs-stable
        system
        ;
    })
  ) (builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.)));
in {
  nixpkgs.overlays = overlays;
}
