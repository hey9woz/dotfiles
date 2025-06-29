# 🛠️ dotfiles

$> Creating my own minimal and portable development environment

![Maintainer](https://img.shields.io/badge/Maintainer-hey9woz-blue)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

## ✨ Features

- ⚡ **Fast** and modular plugin management via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🧼 Clean setup, easy to understand and maintain
- 📦 Git-based environment for portability (Linux / WSL / macOS)
- 📁 Elegant file browsing with [`oil.nvim`](https://github.com/stevearc/oil.nvim)
- 📚 Ready to be extended with LSP, formatters, linters, etc.

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
└── .gitignore             # Files to exclude (e.g. .bash_aliases)

```

## 🚀 Getting Started

```bash
git clone git@github.com:yourname/dotfiles.git ~/dotfiles

# Symlink config files (⚠️ remove or backup existing files first)
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/.bashrc ~/.bashrc
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

| Action             | Keys                            | Description                       |
| ------------------ | ------------------------------- | --------------------------------- |
| Copy Mode          | {prefix} → [                    | Enter copy mode (vi-style)        |
| Paste Buffer       | {prefix} → ]                    | Paste copied content              |
| Reload Config      | {prefix} → r                    | Reload `.tmux.conf`               |
| Split Vertical     | {prefix} → v                    | Split pane left/right             |
| Split Horizontal   | {prefix} → h                    | Split pane top/bottom             |
| Move Between Panes | {prefix} → ← / ↑ / ↓ / →        | Move focus across panes (default) |
| Resize Pane        | {prefix} → Ctrl + ← / ↑ / ↓ / → | Resize pane (default behavior)    |

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

| File                 | Purpose                                                          |
| -------------------- | ---------------------------------------------------------------- |
| `init.lua`           | Entry point. Loads options, keymaps, plugins                     |
| `config/options.lua` | Editor behavior settings (line numbers, indent, clipboard, etc.) |
| `config/keymaps.lua` | Leader key mappings and shortcuts                                |
| `plugins/`           | Plugin configs (lazy-loaded)                                     |

#### 🚀 Basic Key Bindings

| Action             | Keys        | Description                 |
| ------------------ | ----------- | --------------------------- |
| Save file          | `<leader>w` | Write/save current file     |
| Quit               | `<leader>q` | Quit buffer                 |
| Clear search       | `<leader>h` | Clear search highlights     |
| Paste (system)     | `<leader>p` | Paste from system clipboard |
| Yank (visual mode) | `<leader>y` | Yank to system clipboard    |

### 🛠 Git aliases

To simplify frequent Git operations, a set of useful Git aliases is defined in [`dotfiles/gitconfig.example`](./gitconfig.example).
These aliases require you to **prefix with `git`** (e.g. `git gs`) and avoid conflicts with system binaries like `gs` (Ghostscript).

| Alias       | Full Command                                 | Description                                     |
| ----------- | -------------------------------------------- | ----------------------------------------------- |
| `git gs`    | `git status`                                 | Show current working tree status                |
| `git gst`   | `git status`                                 | Safer alias (avoids conflict with `gs` command) |
| `git st`    | `git status -sb`                             | Short status with branch info                   |
| `git gco`   | `git checkout`                               | Switch branches                                 |
| `git gcb`   | `git checkout -b`                            | Create and switch to a new branch               |
| `git gb`    | `git branch`                                 | List local branches                             |
| `git gbD`   | `git branch -d`                              | Delete a local branch                           |
| `git ga`    | `git add`                                    | Stage files                                     |
| `git gaA`   | `git add -A`                                 | Stage all changes                               |
| `git gc`    | `git commit`                                 | Commit changes                                  |
| `git gcm`   | `git commit -m`                              | Commit with message                             |
| `git amend` | `git commit --amend`                         | Edit last commit                                |
| `git undo`  | `git reset --soft HEAD^`                     | Undo last commit (keep changes in working tree) |
| `git gf`    | `git fetch`                                  | Fetch updates from remote                       |
| `git gpoh`  | `git push origin HEAD`                       | Push current branch to origin                   |
| `git gm`    | `git merge`                                  | Merge branches                                  |
| `git gl`    | `git log`                                    | Full log view                                   |
| `git glO`   | `git log --oneline`                          | Compact log view                                |
| `git glO10` | `git log --oneline -10`                      | Last 10 commits in one-line format              |
| `git glO20` | `git log --oneline -20`                      | Last 20 commits in one-line format              |
| `git glOg`  | `git log --oneline --graph`                  | Visual commit graph                             |
| `git lol`   | `git log --oneline --graph --decorate --all` | Full decorated graph of all refs                |
| `git last`  | `git log -1 HEAD`                            | Show last commit only                           |
| `git gsa`   | `git stash`                                  | Stash current changes                           |
| `git al`    | `git config --get-regexp ^alias\\.`          | List all defined Git aliases                    |

- ✅ Always use aliases with the `git` prefix to prevent shell conflicts.
- 📁 Keep `.gitconfig.example` under version control.

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

---

### 🧠 LSP & Autocompletion

> Minimal and practical setup for LSP (Language Server Protocol) and autocompletion using `nvim-lspconfig`, `nvim-cmp`, and `mason.nvim`.
> Inspired by [lsp-zero](https://lsp-zero.netlify.app/docs/language-server-configuration) for intuitive keymaps and clean defaults.

```lua
-- LSP usage
-- ----------------------------------------
-- `K`         : Show documentation (hover)
-- `gd`        : Go to definition
-- `gD`        : Go to declaration
-- `gi`        : Go to implementation
-- `go`        : Go to type definition
-- `gr`        : List references
-- `gs`        : Show signature help
-- `<F2>`      : Rename symbol
-- `<F3>`      : Format code (normal & visual mode)
-- `<F4>`      : Code action (e.g., quickfix/import)

-- Autocompletion (Insert Mode)
-- `<C-n>`     : Select next item
-- `<C-p>`     : Select previous item
-- `<C-Space>` : Trigger completion menu
-- `<CR>`      : Confirm selected item
-- `<C-d/u>`   : Scroll documentation
-- ----------------------------------------
```

#### 📦 LSP Server Installation (via mason.nvim)

This setup uses `mason.nvim` + `mason-lspconfig.nvim` to automatically install and configure any LSP server you request via `lspconfig`.

💡 **To install a server**, simply open Neovim and run:

```bash
:Mason
```

Inside the Mason UI:

- Press `i` to install a selected server
- Use `/` to search (e.g. `tsserver`, `pyright`, `gopls`, `html`, etc.)

💡 Alternatively, servers are **auto-installed** the moment you reference them via:

```lua
require("lspconfig").tsserver.setup({})
```

(as handled by the `handlers` section in `mason-lspconfig`)

#### 🛠 Example: Install & Activate `pyright`

1. Run `:Mason` and install `pyright`
2. The following will automatically configure it:

```lua
require("lspconfig").pyright.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
```

No manual binary install is required!

🔗 [View plugin config](https://github.com/hey9woz/dotfiles/blob/main/nvim/lua/plugins/lsp.lua)

### ✨ Format on Save (conform.nvim + prettierd)

> Automatically formats supported filetypes on save using `conform.nvim` and `prettierd`.

```lua
-- Supported filetypes
-- ----------------------------------------
-- javascript
-- typescript
-- html
-- css
-- json
-- markdown
-- yaml

-- Format on save is enabled with LSP fallback
-- ----------------------------------------
```

#### 🛠 Formatter Installation (via mason.nvim)

Formatting tools are **not automatically installed**.
To install a formatter such as `prettierd`, open Neovim and run:

```bash
:Mason
```

Then:

- Use `/` to search for `prettierd`
- Press `i` to install it

💡 Once installed, formatting will be triggered automatically on save.

🔗 [View plugin config](https://github.com/hey9woz/dotfiles/blob/main/nvim/lua/plugins/conform.lua)

## 📝 License

This project is licensed under the MIT License.
Feel free to clone, modify, and use it in your own projects.
