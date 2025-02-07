{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  # installed font define in modules/font.nix
  # home.packages = with pkgs; [
  # ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      swaync.enable = false;
      hyprland.enable = true;
      hyprlock.enable = true;
    };
    cursor = {
      name = "Vanilla-DMZ";
      size = 32;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 13;
        applications = 11;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = ./anime.jpg;
    imageScalingMode = "fit";
    opacity = {
      popups = 0.8;
      terminal = 0.85;
    };
  };
}
