return {
  'gbprod/yanky.nvim',
  opts = {
    highlight = {
      on_put = false,
      on_yank = false,
      -- timer = 80,
    },
  },
  keys = {
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
    { 'gi', '<Plug>(YankyPreviousEntry)' },
    { 'gn', '<Plug>(YankyNextEntry)' },
    { 'gp', '<Plug>(YankyPutAfterCharwise)' },
    -- { ']p', '<Plug>(YankyPutIndentAfterLinewise)' },
    -- { '[p', '<Plug>(YankyPutIndentBeforeLinewise)' },
    -- { ']P', '<Plug>(YankyPutIndentAfterLinewise)' },
    -- { '[P', '<Plug>(YankyPutIndentBeforeLinewise)' },
    --
    -- { '>p', '<Plug>(YankyPutIndentAfterShiftRight)' },
    -- { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)' },
    -- { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)' },
    -- { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)' },
    --
    -- { '=p', '<Plug>(YankyPutAfterFilter)' },
    -- { '=P', '<Plug>(YankyPutBeforeFilter)' },
  },
}
