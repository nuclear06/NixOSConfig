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

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        color = "rgba(235, 219, 178, 1.0)";
        position = "0, 600";
        halign = "center";
        walign = "center";

        shadow_passes = 5;
        shadow_size = 10;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          placeholder_text = "baka";
          shadow_passes = 1;

          fade_on_empty = true;
          fade_timeout = 1000;
          fail_color = "rgb(204, 34, 34)";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
