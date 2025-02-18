{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      # default session is cage
      # use Hyprland will cause unnecessary troubles, because Hyprland require pass config file path.
      # but the binary file path of regreet need be parsed in nix system
      # $default_session = { "{pkgs.dbus}/bin/dbus-run-session ${lib.getExe pkgs.cage} ${lib.escapeShellArgs cfg.cageArgs} -- ${lib.getExe cfg.package}" };
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
        path = ./. + /regreet.png;
        fit = "Fill";
      };
    };
  };
}
