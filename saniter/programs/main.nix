{ pkgs, ... }:

{
  programs = {
    fastfetch.enable = true;
    fd.enable = true;
  };
  home.packages = with pkgs; [
    google-chrome
    # latex
    python312Packages.pylatexenc
    # develop
    # nixd

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
    nautilus
    w3m # web browser in console
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
}
