{
  lib,
  configs,
  pkgs,
  system,
  inputs,
  ...
}:

{
  home.packages = [ inputs.Neve.packages.${system}.default ];
}
