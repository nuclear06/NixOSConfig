{
  pkgs,
  ...
}:

{
  programs.nvf = {
    enableManpages = true;
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        undoFile.enable = true;
        telescope.enable = true;
        options = {
          shiftwidth = 2;
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          # lspkind.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          otter-nvim.enable = true;
        };
        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };
        treesitter = {
          enable = true;
          addDefaultGrammars = true;
          autotagHtml = true;
          context.enable = true;
          highlight.enable = true;
          incrementalSelection.enable = true;
          indent.enable = true;
          fold = true;
          # Maybe just install every single one?
          grammars = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            yaml
            xml
            toml
            latex
            javascript
            json
            ini
            just
          ];
        };
        languages = {
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableTreesitter = true;
          enableLSP = true;

          nix = {
            enable = true;
            format = {
              type = "nixfmt";
              package = pkgs.nixfmt-rfc-style;
            };
            # TODO change lsp to nixd
          };

          # write
          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
            lsp.enable = false;
            format.type = "prettierd";
            format.enable = false;
          };

          # frontend
          ts.enable = true;
          html.enable = true;
          css.enable = true;
          # tailwind.enable = true;

          # script
          bash.enable = true;
          python = {
            enable = true;
            format.type = "black-and-isort";
          };
          lua.enable = true;

          # backend
          java.enable = true;
          kotlin.enable = true;
          go.enable = true;

          # misc
          sql.enable = true;
        };

      };
    };
  };
}
