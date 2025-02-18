{
  pkgs,
  config,
  ...
}: {
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {enableWlrSupport = true;};
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/picture/screenshot";
        disabledGrimWarning = true;
        autoCloseIdleDaemon = false;
        disabledTrayIcon = true; # open flameshot gui by click tray icon seems has bug on hyprland
      };
      Shortcuts = {
      };
    };
  };
}
