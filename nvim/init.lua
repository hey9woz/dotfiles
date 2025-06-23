-- ════════════════════════════════════════════════════════════════════════
-- 🚀 nvim :: init
-- ------------------------------------------------------------------------
-- Entry point for Neovim configuration.
-- Loads options, keymaps, and plugins using lazy.nvim.
-- See: https://neovim.io/doc/user/lua-guide.html
-- ════════════════════════════════════════════════════════════════════════


-- Core settings
require("config.options")
require("config.keymaps")

-- Bootstrap lazy.nvim (auto-installs if not present)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from lua/plugins/
require("lazy").setup("plugins")

