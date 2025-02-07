{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland --config ${./. + /hyprland.conf}";
        user = "greeter";
      };
    };
  };
  programs.regreet = {
    enable = true;
    cursorTheme = {
      package = pkgs.oreo-cursors-plus;
      name = "oreo_spark_vibrant_violet_magenta_bordered_cursors";
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };

    settings = {
      background = {
        path = ./. + /regreet.jpg;
        fit = "Fill";
      };
    };
  };
}
