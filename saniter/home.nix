{
  config,
  pkgs,
  inputs,
  user,
  system,
  ...
}:

{
  # 注意修改这里的用户名与用户目录
  home.username = user;
  home.homeDirectory = "/home/${user}";

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };
  imports = [
    ./programs
    ./desktop
  ];

  home.packages = with pkgs; [
    fastfetch
    google-chrome

    # archives
    zip
    xz
    unzip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    file
    fd
    mosh
    copyq
    yazi
    kdePackages.dolphin
    imv
    obs-studio

    # networking tools
    mtr # A network diagnostic tool
    dnsutils # `dig` + `nslookup`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility

    # misc
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    brightnessctl
    playerctl
    showmethekey

    # nix related

    # productivity
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    wlogout

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "Saniter";
    userEmail = "91713418+nuclear06@users.noreply.github.com";
    ignores = [
      ".cache/"
      ".idea/"
      "*.swp"
      ".direnv/"
      "node_modules"
    ];
    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      color.ui = "1";
    };
  };
  programs.zsh = {
    enable = true;
  };
  programs.neovim = {
    enable = true;
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
