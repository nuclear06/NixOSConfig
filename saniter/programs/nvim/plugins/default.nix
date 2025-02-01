{
  config.vimConf = {
    mini = {
      ai.enable = true;
      animate.enable = false;
      files.enable = true;
      hipatterns.enable = true;
      icons.enable = true;
      map.enable = true;
      surround.enable = true;
      pairs.enable = true;
    };
    assistant.copilot = {
      enable = true;
      cmp.enable = true;
    };
    git.gitsigns = {
      enable = true;
      codeActions.enable = true;
    };
    comments.comment-nvim.enable = true;
    dashboard.dashboard-nvim.enable = true;
    # TODO: configure alpha
    dashboard.alpha.enable = true;
    tabline.nvimBufferline.enable = true;
    fzf-lua.enable = true;
    filetree.neo-tree.enable = true;
    notes.todo-comments.enable = true;
    lsp.trouble.enable = true;
    notify.nvim-notify.enable = true;
    utility.yanky-nvim.enable = true;
    ui.colorizer.enable = true;
    ui.noice = {
      enable = true;
      setupOpts.presets = {
        presets.inc_rename = true;
        lsp_doc_border = true;
      };
    };
  };
}
