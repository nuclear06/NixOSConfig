{ lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        # disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = [
        # Hours
        {
          text = ''cmd[update:1000] echo "<b><big> $(date +"%H") </big></b>"'';
          font_size = 112;
          font_family = "Geist Mono 10";
          shadow_passes = 3;
          shadow_size = 4;
          position = "0, 35%";
          halign = "center";
          valign = "center";
        }
        # Minutes
        {
          text = ''cmd[update:1000] echo "<b><big> $(date +"%M") </big></b>"'';
          font_size = 112;
          font_family = "Geist Mono 10";
          shadow_passes = 3;
          shadow_size = 4;
          position = "0, 20%";
          halign = "center";
          valign = "center";
        }
        # Today
        {
          text = ''cmd[update:18000000] echo "<b><big> $(date +"%A") </big></b>"'';
          font_size = 22;
          font_family = "JetBrains Mono Nerd Font 10";

          position = "0, 10%";
          halign = "center";
          valign = "center";
        }
        # Week
        {
          text = ''cmd[update:18000000] echo "<b> "$(date +'%d %b')" </b>"'';
          font_size = 18;
          font_family = "JetBrains Mono Nerd Font 10";

          position = "0, 6%";
          halign = "center";
          valign = "center";
        }
        # Degrees
        {
          text = ''cmd[update:18000000] echo "<b><big> $(curl --noproxy '*' -s 'wttr.in?format=3&m' | tr -d '+') </big></b>"'';
          font_size = 18;
          font_family = "Geist Mono 10";
          position = "0, 40";
          halign = "center";
          valign = "bottom";
        }
      ];

      background = {
        path = lib.mkDefault "../stylix/wallpaper.png";
        blur_passes = 3; # 0 to disable blur
        blur_size = 4;
        noise = 0.0117;
        contrast = 1.3000;
        brightness = 0.8000;
        vibrancy = 0.2100;
        vibrancy_darkness = 0.0;
      };

      input-field = {
        size = "250, 50";
        outline_thickness = 3;
        dots_size = 0.26; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rouding = -1;

        rounding = 22;
        # outer_color = $color0;
        # inner_color = $color0;
        # font_color = $color6;
        fade_on_empty = true;
        placeholder_text = "<i>baka</i>"; # Text rendered in the input box when it's empty.

        position = "0, 120";
        halign = "center";
        valign = "bottom";
      };
    };
  };
}
