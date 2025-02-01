{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
    settings = {
      General = {
        savePath = "$HOME/picture/screenshot";
        disableGrimWarning = true;
        autoCloseIdleDaemon = false;
      };
      Shortcuts = {

      };
    };
  };
}
