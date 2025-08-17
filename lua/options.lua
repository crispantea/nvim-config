-- lua/options.lua
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- General
o.number = true        -- show line numbers
o.relativenumber = true
o.wrap = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.clipboard = "unnamedplus"  -- system clipboard
o.ignorecase = true
o.smartcase = true
o.cursorline = true

-- Searching
o.hlsearch = true
o.incsearch = true

-- Misc
o.termguicolors = true

