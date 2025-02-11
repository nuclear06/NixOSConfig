{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      windowrulev2 = [
        "float, title:图片查看器"
        "center, title:图片查看器"
      ];
    };
  };

}
