{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical.target";
    };
    style = ./style.css;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/launcher"
          "temperature"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
          "custom/playerctl"
        ];
        modules-right = [
          "pulseaudio"
          "memory"
          "cpu"
          "network"
          "custom/powermenu"
          "tray"
        ];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "active" = "";
            "default" = "";
            "empty" = "";
          };
          "persisrent-workspaces" = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
        };
        "custom/playerctl" = {
          "format" = "{icon}  <span>{}</span>";
          "return-type" = "json";
          "max-length" = 55;
          "exec" =
            "playerctl -a metadata --format '{\"text\": \"  {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "on-click-middle" = "playerctl previous";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl next";
          "format-icons" = {
            "Paused" = "<span foreground='#6dd9d9'></span>";
            "Playing" = "<span foreground='#82db97'></span>";
          };
        };
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill anyrun || anyrun";
          "on-click-middle" = "exec default_wall";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pamixer -t";
          "tooltip" = false;
        };
        "clock" = {
          "format" = "{=%I=%M=%S %p} ";
          "interval" = 1;
          "tooltip-format" = "<tt>{calendar}</tt>";
          "calendar" = {
            "format" = {
              "today" = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "shift_down";
            "on-click" = "shift_up";
          };
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
        };
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected!";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "pkill wlogout || wlogout";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }
    ];
  };
}
