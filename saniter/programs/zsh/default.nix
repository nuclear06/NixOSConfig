{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      oh-my-zsh = {
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
      };
    };
  };

  home.file.".zshrc".text = ''

  '';
}
