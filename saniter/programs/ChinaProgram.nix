{pkgs, ...}: {
  home.packages = with pkgs; [
    qq
    wechat-uos
    wpsoffice-cn
    pkgs.nur.repos.novel2430.wemeet-bin-bwrap
  ];
}
