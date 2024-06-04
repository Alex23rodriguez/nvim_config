return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {

    'unblevable/quick-scope',
    lazy = false,
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = '#e37933', underline = true, ctermfg = 155 })
      vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = '#e8274b', underline = true, ctermfg = 81 })
    end,
  },
}
