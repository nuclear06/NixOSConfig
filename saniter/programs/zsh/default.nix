{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "fino-time";
        plugins = [
          "git"
          "sudo"
          "eza"
          "autojump"
          "extract"
          "dirhistory"
          "aliases"
        ];
      };

      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ju = "just";
        ez = "eza -l";
        sduo = "sudo";
        nv = "nvim";
        cls = "clear";
        ld = "lazydocker";
        lg = "lazygit";
        na = "nautilus";
      };
    };
  };
}
