-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--------------------------------------
-- General Keymaps -------------------

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Description pending" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Description pending" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Description pending" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Description pending" })

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Description pending" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Description pending" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Description pending" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Description pending" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Description pending" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Description pending" })

-- Clear highlights
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })

-- Close buffers
keymap.set("n", "<S-q>", "<cmd>Bdelete!<CR>", { desc = "Description pending" })

-- Better paste
-- keymap.set("v", "p", '"_dP', { desc = "Description pending" })

-- Center views
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Description pending" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Description pending" })
keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Description pending" })

keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open Netrw" })

-- Insert --
-- Press jk fast to enter
-- keymap.set("i", "jk", "<ESC>", { desc = "Description pending" })
