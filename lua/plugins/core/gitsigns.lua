-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = false,

  keys = {
    {
      '<leader>Gb',
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      desc = 'Git blame line',
    },
    {
      '<leader>Gh',
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = 'Git view hunk',
    },
    {
      '<leader>Gd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'Git diff',
    },
  },

  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
