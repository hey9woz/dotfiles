-- Basic Settings
-- View doc:
-- => https://neovim.io/doc/user/lua-guide.html#_vim.opt

-- Display
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Show relative line numbers

-- Indentation
vim.opt.tabstop = 4               -- Width of a tab character (visual)
vim.opt.shiftwidth = 4            -- Indent width for auto-indent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Smart auto-indenting on new lines

-- Search
vim.opt.ignorecase = true         -- Ignore case in search by default
vim.opt.smartcase = true          -- Override ignorecase if uppercase is used
vim.opt.hlsearch = true           -- Highlight search results
vim.opt.incsearch = true          -- Show matches while typing

-- UI enhancements
vim.opt.cursorline = true         -- Highlight current line
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.signcolumn = "yes"        -- Always show sign column (e.g. for Git/LSP)

-- File behavior
vim.opt.swapfile = false          -- Disable swap file
vim.opt.backup = false            -- Disable backup file
vim.opt.undofile = true           -- Enable persistent undo
vim.opt.scrolloff = 5             -- Keep 5 lines above/below cursor

-- Keymap
vim.g.mapleader = " "             -- Set <leader> key to space

-- Auto-install lazy.nvim if not installed
-- This makes the config portable: it works immediately even on a fresh system
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim and scan lua/plugins/ to load plugin configurations
require("lazy").setup("plugins")

