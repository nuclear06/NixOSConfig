{
  pkgs,
  config,
  lib,
  ...
}:

{
  home.file.".config/fcitx5/Rime".source = config.lib.file.mkOutOfStoreSymlink ./. + "/Rime";
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-rime
        librime-lua
      ];
      waylandFrontend = true;
    };
  };
}
