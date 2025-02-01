{
  vimConf = {
    snippets.luasnip = {
      enable = true;
      providers = [
        "friendly-snippets"
        "mini-snippets"
      ];
      setupOpts.enable_autosnippets = true;
    };
    autocomplete = {
      nvim-cmp = {
        enable = true;
        setupOpts.completion.completeopt = "menu,menuone,noinsert,preview";
        sourcePlugins = [
          "cmp-buffer"
          "cmp-luasnip"
          "cmp-nvim-lsp"
          "cmp-path"
          "cmp-treesitter"
        ];
        mappings = {
          close = "<C-e>"; # ctrl-e
          complete = "<C-p>"; # ctrl-space
          confirm = "<CR>"; # return
          next = "<Tab>";
          previous = "<S-Tab>";
          scrollDocsDown = "<C-f>";
          scrollDocsUp = "<C-d>";
        };
      };
    };
  };
}
