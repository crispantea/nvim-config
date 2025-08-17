-- lua/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Quick file explorer (optional)
map("n", "<leader>pv", ":Ex<CR>", opts)

