-- oil.nvim: A modern file manager for Neovim (buffer-based)
-- Official repo: https://github.com/stevearc/oil.nvim
--
-- Inspired by TJ DeVries' config:
-- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/oil.lua
-- I decided to use it after watching his video:
-- https://www.youtube.com/watch?v=218PFRsvu2o


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
return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand "%"
        path = path:gsub("oil://", "")
        return "  " .. vim.fn.fnamemodify(path, ":.")
      end

      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
        },
        win_options = {
          winbar = "%{v:lua.CustomOilBar()}",
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
            return vim.tbl_contains(folder_skip, name)
          end,
        },
      }

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
  },
}

