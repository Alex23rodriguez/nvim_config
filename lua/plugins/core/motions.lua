return {
  {
    'unblevable/quick-scope',
    lazy = false,
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = '#e37933', underline = true, ctermfg = 155 })
      vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = '#e8274b', underline = true, ctermfg = 81 })
    end,
  },

  -- {
  --   'ggandor/leap.nvim',
  --   keys = {
  --     { 'U', '<Plug>(leap-backward)', mode = { 'n', 'x', 'o' } },
  --     { 'E', '<Plug>(leap-forward)', mode = { 'n', 'x', 'o' } },
  --     { 'ge', '<Plug>(leap-from-window)', mode = { 'n', 'x', 'o' } },
  --   },
  -- },
  'jeetsukumaran/vim-indentwise',
  {
    'ThePrimeagen/harpoon',
    keys = {
      -- Harpoon navigation
      { '<leader>m', "<cmd>lua require('harpoon.mark').add_file()<CR>" },
      { '<leader>h', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
      { '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
      { '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
      { '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<CR>" },
      { '<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<CR>" },
      { '<leader>7', "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>" },
      { '<leader>8', "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>" },
      { '<leader>9', "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>" },
      { '<leader>0', "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>" },
    },
  },
}
