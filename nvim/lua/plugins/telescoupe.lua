-- usage
-- ----------------------------------------
-- <leader>ff : Find files
-- <leader>fg : Live grep (requires ripgrep)
-- <leader>fb : List open buffers
-- <leader>fh : Search help tags
-- ----------------------------------------


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  -- Warn if ripgrep is not included
  build = function()
    if vim.fn.executable('rg') == 0 then
      vim.notify(
        'ripgrep (rg) is not installed. Please install it to enable live_grep.',
        vim.log.levels.WARN
      )
    end
  end,

  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap.set

    telescope.setup({})

    keymap('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    keymap('n', '<leader>fg', builtin.live_grep,  { desc = '[F]ind by [G]rep' })
    keymap('n', '<leader>fb', builtin.buffers,    { desc = '[F]ind [B]uffers' })
    keymap('n', '<leader>fh', builtin.help_tags,  { desc = '[F]ind [H]elp' })
  end,
}

