{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
      ];

      monitor = ",1920x1080@100,auto,1";
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";

      exec-once = [
        "v2rayA --lite"
        # "waybar"
        # "swaync"
        "copyq --start-server"
        "sh $HOME/.config/scripts/init/*"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 5;

        resize_on_border = true;

        # https://wiki.hyprland.org/Configuring/Tearing/
        # Screen tearing is used to reduce latency and/or jitter in games.
        allow_tearing = true;
        layout = "dwindle";
        # layout = "master";
      };

      decoration = {
        rounding = 5;

        active_opacity = 1.0;
        inactive_opacity = 0.85;

        shadow = {
          enabled = true;
        };

        blur = {
          enabled = true;
        };
      };

      animations = {
        enabled = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
