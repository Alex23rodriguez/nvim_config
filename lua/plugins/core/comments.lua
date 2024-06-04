-- "gc" to comment visual regions/lines
return {
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
