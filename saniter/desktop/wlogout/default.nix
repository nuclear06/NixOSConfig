{ ... }:
{
  home.file = {
    ".config/wlogout/icons" = {
      source = ./icons;
      recursive = true;
    };
  };
  programs.wlogout = {
    enable = true;
    style = ./style.css;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "hibernate";
        action = "hyprlock && systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
    ];
  };

}
