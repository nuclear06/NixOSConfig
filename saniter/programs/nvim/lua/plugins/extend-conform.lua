return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = false,
      -- formatters_by_ft = {
      --   ["markdown"] = { "prettier" },
      -- },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },
  },
}
