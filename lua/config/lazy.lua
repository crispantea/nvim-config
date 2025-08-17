-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    lazy = false,       -- Load immediately
    priority = 1000,    -- Ensure it loads before other plugins
    config = function()
      require("kanagawa").setup({
        theme = "dragon",  -- Always use the Dragon theme
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
  -- Telescope for searching (optional)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
    -- 🌲 Tree-sitter (for advanced syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Auto-install parsers on setup
    config = function()
      require("nvim-treesitter.configs").setup({
        -- List of languages to install parsers for
        ensure_installed = {
          "c", "cpp", "rust", "python", "go", "java", "javascript",
          "typescript", "lua", "vim", "bash", "json", "html", "css",
        },
        -- Enable syntax highlighting
        highlight = { enable = true },
        -- Disable for problematic filetypes (optional)
        -- If you get errors in bash/sh files, add:
        -- highlight = { disable = { "bash", "sh" } },
      })
    end,
  },
})
