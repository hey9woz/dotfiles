-- ════════════════════════════════════════════════════════════════════════
-- 🛠  nvim :: minimal config - options
-- ------------------------------------------------------------------------
-- This file configures Neovim's core behavior via `vim.opt`.
-- It includes display, editing, search, UI, and file handling preferences.
--
-- Each section is minimal yet sufficient for an efficient workflow.
-- You can expand or override these settings as needed in your setup.
-- ════════════════════════════════════════════════════════════════════════

local opt = vim.opt

-- Display
opt.number = true               -- Show absolute line numbers
opt.relativenumber = true       -- Show relative line numbers

-- UI Enhancements
opt.cursorline = true           -- Highlight current line
opt.termguicolors = true        -- Enable 24-bit RGB color
opt.signcolumn = "yes"          -- Always show sign column

-- Indentation
opt.tabstop = 4                 -- Visual width of tab character
opt.shiftwidth = 4              -- Indent width for auto-indent
opt.expandtab = true            -- Convert tabs to spaces
opt.smartindent = true          -- Auto indent new lines intelligently

-- Search
opt.ignorecase = true           -- Case-insensitive search by default
opt.smartcase = true            -- Case-sensitive if uppercase is in query
opt.hlsearch = true             -- Highlight all search matches
opt.incsearch = true            -- Show matches as you type

-- File Behavior
opt.swapfile = false            -- Disable swap file
opt.backup = false              -- Disable backup file
opt.undofile = true             -- Enable persistent undo
opt.scrolloff = 5               -- Keep 5 lines above/below the cursor

-- Clipboard Integration
opt.clipboard = "unnamedplus"   -- Use system clipboard for all yanks/pastes
-- Example: Visual → y → Ctrl+V in other apps just works.

