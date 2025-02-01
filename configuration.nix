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

  networking.hostName = "BlueDeep"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  networking.proxy.default = "http://192.168.31.100:10808";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # NVIDIA Configuration ###################################
  hardware.graphics = {
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
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    # displayManager.gdm.enable = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=15
  '';

  nix.gc = {
    automatic = true;
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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpAkqa7zWPOLNzO4MMHO7fX5TwcgglQSP5/19YX6DMcissSPtEUXLS/xGIXbIcc5YcpJHa8PYk01Mr/7LlbYbTsKG1eT7IEPO9MS6bnc3Oz+hYM/P4o8b/1IkbpT9sGomgK92MozW9svwXFDaAV5BZwRZ0hEG9XHjPGgYFM80totVTpmNYXpsYc/5FREAANuqUYZrWaC+IvrwX6YT/a1DLGTOciEPo5BguqeSAQgMgOl2+zIeyxfLZfeYM4kA+xOouSF286KJyMfv+mlanNuBqxi9+PbZ9sje2OHjmJENqA6jt6JsT6tMpYzdOrjIlyo2M2kk6Kdh+YL7zoTuzbwfe20K8xtkmrr8hHk09+EOU/pQgROV0+v0EGOU3fJat1G9uoSG4xpYSMqTKrjhTaZCO+g326s7C/zoXx3to1Aat+J+TkiaRYsjV7ZbfkgHW/GZ48XY+p9DScaSPPcZaWG2tqHNfeHhgImsVslL1BZzrQ/4Pzft5W2Jz0rdPsoSLFas= dzj292543054@hotmail.com"
    ];
  };

  environment.variables.EDITOR = "nvim"; # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;

  users.defaultUserShell = pkgs.zsh;


  programs.zsh = {
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
  # enable Ozone Wayland support for Electron and Chromium
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
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
