return {
  'nvim-treesitter/nvim-treesitter-context',
  lazy = false,
  keys = {
    { '<leader>k', '<cmd>TSContextToggle<cr>', { desc = 'Toggle Treesitter Context' } },
    {
      '[c',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      { desc = 'Jump up [n] contexts' },
    },
  },
  -- config = true,
  opts = {
    max_lines = 20,
    multiline_threshold = 8,
    separator = '-',
  },
}
