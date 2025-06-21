-- ════════════════════════════════════════════════════════════════════════
-- 🎯 nvim :: keymaps
-- ------------------------------------------------------------------------
-- Defines custom key mappings.
-- Includes leader key, common actions, pane navigation, etc.
-- ════════════════════════════════════════════════════════════════════════

-- Set <leader> to space
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic file operations
map("n", "<leader>w", "<cmd>w<CR>", opts)    -- Save
map("n", "<leader>q", "<cmd>q<CR>", opts)    -- Quit
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- Clear search highlight

-- System clipboard paste
map("n", "<leader>p", '"+p', opts)     -- Paste from system clipboard
map("v", "<leader>y", '"+y', opts)     -- Yank to system clipboard

