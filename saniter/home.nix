{
  config,
  pkgs,
  nur,
  inputs,
  user,
  system,
  ...
}:

{
  # 注意修改这里的用户名与用户目录

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };
  imports = [
    ./programs
    ./desktop
    ./hooks
    ./scripts
    ./options
  ];
  services.copyq.enable = true;
  programs = {
    # pywal.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
  };
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    packages = with pkgs; [
      google-chrome
      # latex
      python312Packages.pylatexenc
      # develop
      nixd
      # gnumake
      # libgcc

      # archives
      zip
      xz
      unzip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      fzf # A command-line fuzzy finder
      file
      mosh
      yazi
      nautilus
      # v2rayn # proxy
      v2raya
      xray
      localsend

      imv # image browse
      obs-studio
      lazygit
      git-filter-repo
      lazydocker
      nwg-look
      pamixer
      alsa-utils
      nvtopPackages.nvidia
      pavucontrol
      xdotool

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

      # monitor
      btop # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system tools
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb

      # WM stuff
      libsForQt5.xwaylandvideobridge
      hyprpicker
    ];

    # git 相关配置
    file.".gitconfig".text = ''
      [advice]
        addIgnoredFile = false
    '';
  };
  programs = {
    zsh = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
