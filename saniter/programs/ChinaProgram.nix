{ pkgs, aur, ... }:
{
  home.packages = with pkgs; [
    qq
    wechat-uos
    wpsoffice-cn
    aur.repos.novel2430.wemeet-bin-bwrap
  ];
}
