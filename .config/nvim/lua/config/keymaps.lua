-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Close buffers
vim.keymap.set("n", "<S-q>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
