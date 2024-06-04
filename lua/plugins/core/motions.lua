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

  {
    'ggandor/leap.nvim',
    keys = {
      { 'U', '<Plug>(leap-backward)', mode = { 'n', 'x', 'o' } },
      { 'E', '<Plug>(leap-forward)', mode = { 'n', 'x', 'o' } },
      { 'ge', '<Plug>(leap-from-window)', mode = { 'n', 'x', 'o' } },
    },
  },
}
