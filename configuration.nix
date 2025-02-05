{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.configurationLimit = 10;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      # for dual system ######################
      default = "saved";
      extraEntries = ''
        	      GRUB_SAVEDEFAULT=true
        	      menuentry 'Windows 12' --class windows --class os {
        		      savedefault
        		      insmod part_gpt
        		      insmod fat
        		      search --no-floppy --fs-uuid --set=root 9152-8432
        		      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        	      }
      '';
      useOSProber = false;
      efiSupport = true;
      device = "nodev";
      # for dual system ######################
      minegrub-theme = {
        enable = true;
        splash = "BTW, I use NixOS!";
        background = "background_options/1.8  - [Classic Minecraft].png";
        boot-options-count = 5;
      };
    };
  };
  nix.settings = {
    auto-optimise-store = true;
    trusted-users = [ "saniter" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  networking = {
    hostName = "BlueDeep"; # Define your hostname.
    proxy = {
      # default = "http://192.168.31.100:10808";
      # default = "http://127.0.0.1:10808";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
    # Enable networking
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [
        53317 # localsend
      ];
      allowedUDPPorts = [
        53317 # localsend
      ];
    };
  };

  # Configure network proxy if necessary

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "ctrl:swapcaps";
  };
  console.useXkbConfig = true;

  services.blueman.enable = true;
  hardware = {
    bluetooth.enable = true;

    # NVIDIA Configuration ###################################
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
        vdpauinfo
        libva
        libva-utils
      ];
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    # displayManager.gdm.enable = true;
  };

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=15
  '';

  nix.gc = {
    # use nh to auto gc
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    just
    neovim
    fd
    python3
    git
    autojump
    eza
    wl-clipboard
  ];

  users.users.saniter = {
    isNormalUser = true;
    description = "saniter";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpAkqa7zWPOLNzO4MMHO7fX5TwcgglQSP5/19YX6DMcissSPtEUXLS/xGIXbIcc5YcpJHa8PYk01Mr/7LlbYbTsKG1eT7IEPO9MS6bnc3Oz+hYM/P4o8b/1IkbpT9sGomgK92MozW9svwXFDaAV5BZwRZ0hEG9XHjPGgYFM80totVTpmNYXpsYc/5FREAANuqUYZrWaC+IvrwX6YT/a1DLGTOciEPo5BguqeSAQgMgOl2+zIeyxfLZfeYM4kA+xOouSF286KJyMfv+mlanNuBqxi9+PbZ9sje2OHjmJENqA6jt6JsT6tMpYzdOrjIlyo2M2kk6Kdh+YL7zoTuzbwfe20K8xtkmrr8hHk09+EOU/pQgROV0+v0EGOU3fJat1G9uoSG4xpYSMqTKrjhTaZCO+g326s7C/zoXx3to1Aat+J+TkiaRYsjV7ZbfkgHW/GZ48XY+p9DScaSPPcZaWG2tqHNfeHhgImsVslL1BZzrQ/4Pzft5W2Jz0rdPsoSLFas= saniter@gov.com"
    ];
  };

  programs.mtr.enable = true;

  users.defaultUserShell = pkgs.zsh;

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 10";
      flake = "/etc/nixos";
    };
    zsh = {
      enable = true;
      ohMyZsh = {
        enable = true;
        theme = "fox";
        plugins = [
          "git"
          "sudo"
          "eza"
          "autojump"
          "extract"
          "aliases"
        ];
      };
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ju = "just";
        ez = "eza -l";
        sduo = "sudo";
        nv = "nvim";
        cls = "clear";
        # fix alias for sudo
        # https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
        sudo = "sudo ";
      };
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
  # enable Ozone Wayland support for Electron and Chromium
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
    };
  };

  zramSwap.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
