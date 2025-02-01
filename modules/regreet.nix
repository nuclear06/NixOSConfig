{ pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    settings = { };
    iconTheme.package = pkgs.papirus-icon-theme;
  };
}
