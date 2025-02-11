{
  pkgs,
  myNUR,
  ...
}:
let
  rime-ice = myNUR.rime-ice.override {
    userConfig = ./patch;
  };
in
{
  # install rime-ice config ##########
  home.packages = [
    rime-ice
  ];
  # default to ~/.local/share
  xdg.dataFile."fcitx5/rime" = {
    source = "${rime-ice}/share/rime-data";
    recursive = true;
  };

  # use fcitx5 on wayland
  # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
  gtk = {
    enable = true;
    gtk2.extraConfig = ''gtk-im-module=fcitx'';

    gtk3.extraConfig = {
      gtk-im-module = "fcitx";
    };
    gtk4.extraConfig = {
      gtk-im-module = "fcitx";
    };
  };
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        (fcitx5-rime.override {
          rimeDataPkgs = [ ]; # Remove default config rime-data
        })
        librime-lua
      ];
      waylandFrontend = true;
    };
  };
}
