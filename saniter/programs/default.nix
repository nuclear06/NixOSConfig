{ lib, ... }:
{
  imports = lib.map (f: ./${f}) (
    builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.))
  );
}
