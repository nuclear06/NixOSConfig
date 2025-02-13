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
  xdg.configFile."kitty/relative_resize.py".source = ./relative_resize.py;
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
      "ctrl+shift+n" = "new_os_window_with_cwd";
      "ctrl+k" = "neighboring_window up";
      "ctrl+j" = "neighboring_window down";
      "ctrl+h" = "neighboring_window left";
      "ctrl+l" = "neighboring_window right";
      "alt+j" = "kitten relative_resize.py down  3";
      "alt+k" = "kitten relative_resize.py up    3";
      "alt+h" = "kitten relative_resize.py left  3";
      "alt+l" = "kitten relative_resize.py right 3";
      "ctrl+f" =
        "launch --type=overlay --stdin-source=@screen_scrollback fzf --no-sort --no-mouse --exact -i --tac";
    };

    extraConfig = ''
      map --when-focus-on var:IS_NVIM ctrl+j
      map --when-focus-on var:IS_NVIM ctrl+k
      map --when-focus-on var:IS_NVIM ctrl+h
      map --when-focus-on var:IS_NVIM ctrl+l
      map --when-focus-on var:IS_NVIM alt+j
      map --when-focus-on var:IS_NVIM alt+k
      map --when-focus-on var:IS_NVIM alt+h
      map --when-focus-on var:IS_NVIM alt+l
      allow_remote_control yes
      listen_on unix:@mykitty
    '';
    settings = {
      background_opacity = lib.mkForce "0.93";
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top

    };
  };
}
