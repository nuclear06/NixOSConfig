{
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
}
