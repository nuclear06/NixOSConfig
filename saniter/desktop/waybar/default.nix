{
  config,
  lib,
  pkgs,
  ...
}: let
  custom = import ./modules.nix;
in {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
    };
    style = ./themes/Crystal_Clear.css;
    settings = [
      (
        {
          layer = "top";
          passthrough = false;
          # ipc = true;
          position = "top";
          spacing = 6;
          margin-top = 3;
          margin-left = 8;
          margin-right = 8;
          modules-left = [
            "custom/menu"
            "custom/separator#blank_2"
            "hyprland/workspaces#pacman"
            "custom/separator#blank_2"
            "mpris"
            "tray"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "custom/swaync"
            "cpu"
            "memory"
            "temperature"
            "disk"

            "custom/separator#blank_2"

            "pulseaudio"
            "pulseaudio#microphone"

            "custom/separator#blank_2"
            "custom/power"
          ];
        }
        // custom
      )
    ];
  };
}
