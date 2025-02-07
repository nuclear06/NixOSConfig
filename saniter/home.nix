{
  user,
  ...
}:
{
  imports = [
    ./programs
    ./desktop
    ./hooks
    ./scripts
    ./options
  ];
  services.copyq.enable = true;
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    sessionVariables = {
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      NIXOS_OZONE_WL = 1;
      EDITOR = "nvim";
    };

    # git 相关配置
    file.".gitconfig".text = ''
      [advice]
        addIgnoredFile = false
    '';
  };
  home.stateVersion = "24.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
