{ inputs, ... }:
let
  overlays = builtins.map (f: (import (./. + "/${f}") inputs)) (
    builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.))
  );
in
{
  nixpkgs.overlays = overlays;
}
