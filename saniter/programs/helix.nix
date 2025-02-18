{pkgs, ...}: {
  programs.helix = {
    enable = true;
    # package = pkgs.evil-helix;
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        shell = [
          "bash "
          "-c"
        ];
        insert-final-newline = false;
        line-number = "relative";
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
        };
      };
    };

    languages = {
      language-server = {
        nixd = {
          command = "nixd";
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = ["--quiet"];
          };
          language-servers = ["nixd"];
        }
      ];
    };
  };
}
