{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      windowrulev2 = [
        # for QQ
        "workspace 5,class:(QQ)"
        "float, title:图片查看器"
        "center, title:图片查看器"

        # for Copyq
        "float, class:com.github.hluk.copyq"
        "center, class:com.github.hluk.copyq"

        "float,class:(mpv)|(imv)"

      ];
    };
  };

}
