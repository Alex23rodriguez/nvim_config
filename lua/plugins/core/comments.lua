-- "gc" to comment visual regions/lines
return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- comment code
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
}
