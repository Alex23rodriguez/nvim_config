return {
  'nvim-treesitter/nvim-treesitter-context',
  lazy = false,
  keys = {
    { '<leader>k', '<cmd>TSContextToggle<cr>', { desc = 'Toggle Treesitter Context' } },
  },
  config = true,
  -- opts = {
  -- separator = '-',
  -- },
}
