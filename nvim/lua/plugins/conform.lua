-- Formatter settings using conform.nvim
-- Tool installation is handled manually via :Mason
-- prettierd is used for JS/TS/HTML/CSS/JSON/Markdown/YAML
-- Automatically formats on save

return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Ensure mason is available (used for managing external formatters)
      "williamboman/mason.nvim",
    },
    config = function()
      -- Setup conform with filetype-to-formatter mapping
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          html = { "prettierd" },
          css = { "prettierd" },
          json = { "prettierd" },
          markdown = { "prettierd" },
          yaml = { "prettierd" },
        },
        -- Automatically format on save, fallback to LSP if needed
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}

