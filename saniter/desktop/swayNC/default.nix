# SwayNotificationCenter
# https://github.com/ErikReider/SwayNotificationCenter
{ lib, ... }:
{
  home.file = {
    ".config/swaync/themes" = {
      source = ./themes;
      recursive = true;
    };

    ".config/swaync/icons" = {
      source = ./icons;
      recursive = true;
    };
  };
  services.swaync = {
    enable = true;
    style = lib.mkForce ./style.css;
    settings = {
      positionX = "right";
      positionY = "top";
      cssPriority = "user";

      # Control Center Metrics
      control-center-width = 380;
      control-center-height = 860;
      control-center-margin-top = 2;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;

      # Notification Metrics
      notification-window-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 160;
      notification-body-image-width = 200;

      # Timeouts
      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;

      # Behavior
      fit-to-screen = false;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = false;
      script-fail-notify = true;
      # Scripts
      scripts = {
      };

      # Notification Visibility
      "notification-visibility" = {
      };

      # Widgets
      widgets = [
        "label"
        "buttons-grid"
        "mpris"
        "title"
        "dnd"

        "notifications"
      ];

      # Widget Configuration
      "widget-config" = {
        title = {
          text = "Notifications";
          "clear-all-button" = true;
          "button-text" = " 󰎟 ";
        };
        dnd = {
          text = "Do not disturb";
        };
        label = {
          "max-lines" = 1;
          text = " ";
        };
        mpris = {
          "image-size" = 96;
          "image-radius" = 12;
        };
        volume = {
          label = "󰕾";
          "show-per-app" = true;
        };
        "buttons-grid" = {
          actions = [
            {
              label = " ";
              command = "amixer set Master toggle";
            }
            {
              label = "";
              command = "amixer set Capture toggle";
            }
            {
              label = " ";
              command = "NetworkManager";
            }
            {
              label = "󰂯";
              command = "blueman-manager";
            }
            {
              label = "󰏘";
              command = "nwg-look";
            }
          ];
        };
      };
    };
  };
}
