-- "gc" to comment visual regions/lines
return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- comment code
  {
    'numToStr/Comment.nvim',
    lazy = false,

    keys = {
      {
        '<leader>/',
        'gc',
        mode = 'v',
        remap = true,
        desc = 'Toggle comment',
      },
      {
        '<leader>/',
        'gcc',
        mode = 'n',
        remap = true,
        desc = 'Toggle comment',
      },
    },
    -- options: https://github.com/numToStr/Comment.nvim#configuration-optional
    opts = {
      mappings = { basic = true, extra = false },
    },
  },
  {
    'kkoomen/vim-doge',
    config = function()
      vim.api.nvim_set_var('doge_doc_standard_python', 'google')
      vim.api.nvim_set_var('doge_enable_mappings', false)
      vim.keymap.set('n', '<Leader>D', '<Plug>(doge-generate)')
    end,
  },
}
