{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_options = "caps:swapescape";
    };
    bind = [
      "$mainMod CTRL, Return, exec, $terminal"
      # special process for steam
      "$mainMod CTRL,  Q, exec,$HOME/.config/scripts/hypr/CloseWindows.sh"
      "$mainMod,       R, exec, sh -c yazi $HOME"
      "CTRL    ,   space, exec, pkill anyrun || anyrun"
      "$mainMod,       F, togglefloating,"
      "CTRL_ALT,       L, togglesplit,"
      "$mainMod,       E, exec, nautilus"
      "$mainMod,       V, exec, copyq toggle"
      "$mainMod,       P, exec, hyprpicker -an"
      "$mainMod,       N, exec, swaync-client -t"
      "$mainMod,       M, fullscreen, 1"
      ", Print, exec, flameshot gui -r | copyq write image/png -"
      "CTRL_ALT, A, exec, flameshot gui -r | copyq write image/png -"
      # Moving focus
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"
      "$mainMod SHIFT, h,  swapwindow, l"
      "$mainMod SHIFT, l, swapwindow, r"
      "$mainMod SHIFT, k,    swapwindow, u"
      "$mainMod SHIFT, j,  swapwindow, d"

      # Resizeing windows                   X  Y
      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      # Switching workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod, 0, workspace, 10"
      "$mainMod, Tab, workspace, +1"
      "$mainMod_SHIFT, Tab, workspace, -1"
      "$mainMod_CTRL, l, workspace, +1"
      "$mainMod_CTRL, h, workspace, -1"
      "$mainMod_CTRL, j, movetoworkspacesilent, -1"
      "$mainMod_CTRL, k, movetoworkspacesilent, +1"

      # Moving windows to workspaces
      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

      # Scratchpad
      "$mainMod,       S, togglespecialworkspace,  magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      "$mainMod, bracketright, exec, brightnessctl s 10%+"
      "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
