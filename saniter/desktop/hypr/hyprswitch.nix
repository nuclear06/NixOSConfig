{ inputs, system, ... }:

{
  home.packages = [
    inputs.hyprswitch.packages.${system}.default
  ];
}
