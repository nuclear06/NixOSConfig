-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v", "x", "o" }, "<C-A-l>", function()
  LazyVim.format({ force = true })
end)
vim.keymap.set("i", ";;", "<ESC>", { desc = "Normal mode" })
