{
  lib,
  config,
  ...
}:
###########################################################
#
# Kitty Configuration
#
# Useful Hot Keys for Linux(replace `ctrl + shift` with `cmd` on macOS)):
#   1. Increase Font Size: `ctrl + shift + =` | `ctrl + shift + +`
#   2. Decrease Font Size: `ctrl + shift + -` | `ctrl + shift + _`
#   3. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#
###########################################################
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = lib.mkForce config.stylix.fonts.monospace.name;
    };

    # consistent with other terminal emulators
    keybindings = {
      "ctrl+shift+m" = "toggle_maximized";
      "ctrl+shift+f" = "show_scrollback"; # search in the current window
      "ctrl+shift+enter" = "new_os_window_with_cwd";
      "ctrl+j" = "neighboring_window up";
      "ctrl+k" = "neighboring_window down";
      "ctrl+h" = "neighboring_window left";
      "ctrl+l" = "neighboring_window right";
    };

    settings = {
      background_opacity = lib.mkForce "0.93";
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top

    };
  };
}
