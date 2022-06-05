vim.g.mapleader = " "

vim.api.nvim_set_keymap("", ";", ":", {})
vim.api.nvim_set_keymap("", "<C-a>", "<Plug>(dial-increment)", {})
vim.api.nvim_set_keymap("", "<C-x>", "<Plug>(dial-decrement)", {})

vim.api.nvim_set_keymap("", "<Up>", "<Esc>", {})
vim.api.nvim_set_keymap("", "<Down>", "<Esc>", {})
vim.api.nvim_set_keymap("", "<Left>", "<Esc>", {})
vim.api.nvim_set_keymap("", "<Right>", "<Esc>", {})


-- Splits
vim.api.nvim_set_keymap("", "vv", "<C-W>v", {})
vim.api.nvim_set_keymap("", "ss", "<C-W>s", {})
vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", {})
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", {})
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", {})
vim.api.nvim_set_keymap("n", "<c-s>", ":w<CR>", {})
