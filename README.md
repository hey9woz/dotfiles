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
│   ├── tmux.conf
│   └── scripts/               # Custom tmux helper scripts
│       └── tmux_layout.sh       # Pane layout selector
├── .bashrc                # Bash shell configuration
├── .gitconfig             # Global Git configuration
└── .gitignore             # Files to exclude (e.g. .bash_aliases)

```

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

## ⚙️ Usage Guide

### 📟 tmux usage

I aim to have a minimal, yet powerful tmux setup.

#### 🔑 Prefix Key

{prefix} = Ctrl + a

#### 📋 Key Bindings Overview

| Action             | Keys                            | Description                             |
|--------------------|----------------------------------|-----------------------------------------|
| Copy Mode          | {prefix} → [                    | Enter copy mode (vi-style)              |
| Paste Buffer       | {prefix} → ]                    | Paste copied content                    |
| Reload Config      | {prefix} → r                    | Reload `.tmux.conf`                     |
| Split Vertical     | {prefix} → v                    | Split pane left/right                   |
| Split Horizontal   | {prefix} → h                    | Split pane top/bottom                   |
| Move Between Panes | {prefix} → ← / ↑ / ↓ / →         | Move focus across panes (default)       |
| Resize Pane        | {prefix} → Ctrl + ← / ↑ / ↓ / →  | Resize pane (default behavior)          |

> You can view or customize these bindings in `.tmux.conf`.

### 🧱 Custom Layout Script: `tmux_layout.sh`

A flexible terminal layout bash script that allows you to:

- 🧭 Choose between **default**, **custom**, or **random** layout modes  
- 💡 Split panes interactively by direction (`v` or `h`) and percentage  
- 🎲 Randomize pane layout for creative or testing setups  
- ⚙️ Use via alias: `layout` (see below)  

> 📂 Script Location：`~/dotfiles/tmux/scripts/tmux_layout.sh`

📝 Note:
Ensure the script is executable and aliased properly in your .bash_aliases:

```bash
chmod +x ~/dotfiles/tmux/scripts/tmux_layout.sh
alias layout="~/dotfiles/tmux/scripts/tmux_layout.sh"
```

#### 🔰 Default Layout Example

```bash
$ tmux
$ layout
# → Selects default: vertical split 70/30
```

#### ⚙️ Custom Layout Example

```bash
$ tmux
$ layout
# → Then choose:
#    3 panes
#    v / 30
#    h / 50
```

### 🧠 nvim usage

A clean, modular Neovim config built with `init.lua` + `lua/config/*`.

### 🗂 Structure Overview

| File                          | Purpose                                 |
|-------------------------------|------------------------------------------|
| `init.lua`                   | Entry point. Loads options, keymaps, plugins |
| `config/options.lua`         | Editor behavior settings (line numbers, indent, clipboard, etc.) |
| `config/keymaps.lua`         | Leader key mappings and shortcuts       |
| `plugins/`                   | Plugin configs (lazy-loaded)            |

#### 🚀 Basic Key Bindings

| Action              | Keys             | Description                            |
|---------------------|------------------|----------------------------------------|
| Save file           | `<leader>w`      | Write/save current file                |
| Quit                | `<leader>q`      | Quit buffer                            |
| Clear search        | `<leader>h`      | Clear search highlights                |
| Paste (system)      | `<leader>p`      | Paste from system clipboard            |
| Yank (visual mode)  | `<leader>y`      | Yank to system clipboard               |

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
