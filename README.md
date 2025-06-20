# 🛠️ dotfiles

$> Creating my own minimal and portable development environment

![Maintainer](https://img.shields.io/badge/Maintainer-hey9woz-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

## ✨ Features

* ⚡ **Fast** and modular plugin management via [lazy.nvim](https://github.com/folke/lazy.nvim)
* 🧼 Clean setup, easy to understand and maintain
* 📦 Git-based environment for portability (Linux / WSL / macOS)
* 📁 Elegant file browsing with [`oil.nvim`](https://github.com/stevearc/oil.nvim)
* 📚 Ready to be extended with LSP, formatters, linters, etc.

---

## 📦 Project Structure (Overview)

```text
dotfiles/
├── nvim/                  # All Neovim-related configs
│   ├── init.lua              # Entry point for Neovim config
│   ├── lazy-lock.json        # Plugin lockfile managed by lazy.nvim
│   └── lua/                  # Lua-based configuration
│       ├── plugins/             # One plugin = one file (lazy.nvim)
│       └── config/              # (Optional) Options, keymaps, LSP, etc.
├── tmux/                  # tmux configuration
│   └── tmux.conf
├── .bashrc                # Bash shell configuration
└── .gitconfig             # Global Git configuration
```

---

## 🚀 Getting Started

```bash
git clone git@github.com:yourname/dotfiles.git ~/dotfiles

# Symlink config files (⚠️ remove or backup existing files first)
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
# ...add more as needed
```

Neovim will automatically install lazy.nvim on first launch ✨

```lua
-- https://github.com/hey9woz/dotfiles/blob/main/nvim/init.lua
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
```

---

## ⚙️ Usage Guide

### 📟 tmux usage *(Coming soon)*

> Will include prefix, pane controls, and shortcuts based on `tmux.conf`

*TODO: Add usage examples and tips.*

---

### 💡 nvim usage *(Coming soon)*

> Will document useful keybindings and plugin integrations.

*TODO: Describe leader mappings, plugin commands, and LSP interactions.*

---

## 🔌 Plugins

### 📁 oil.nvim

> A modern file manager that uses Neovim buffers instead of splits.

```lua
-- oil.nvim usage
-- ----------------------------------------
-- `-`         : Open parent directory in current window (like netrw)
-- `<space>-`  : Open in a floating window
-- `<CR>`      : Open file or enter directory
-- `%`         : Create a new file
-- `d`         : Delete file/directory
-- `r`         : Rename
-- `q`         : Close the oil buffer
-- `g?`        : Show help inside oil.nvim
--
-- Hidden files can be shown/filtered via `view_options.show_hidden`
-- You can navigate and edit files like a regular buffer
-- ----------------------------------------
```

🔗 [View plugin config](https://github.com/hey9woz/dotfiles/blob/main/nvim/lua/plugins/oil.lua)

## 📝 License

This project is licensed under the MIT License.
Feel free to clone, modify, and use it in your own projects.
