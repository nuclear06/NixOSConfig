{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcxit5-rime
      ];
      waylandFrontend = true;
    };
  };
}
