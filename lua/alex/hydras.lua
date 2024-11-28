-- Screen mode
local Hydra = require('hydra')
local success, splits = pcall(require, 'smart-splits')
if success then
  Hydra({
    name = 'Screen Mode',
    mode = 'n',
    body = 'S',
    heads = {
      -- move between windows
      { 'n', '<c-w><c-h>', { desc = 'Move left', nowait = true } },
      { 'i', '<c-w><c-l>', { desc = 'Move right', nowait = true } },
      { 'u', '<c-w><c-k>', { desc = 'Move up', nowait = true } },
      { 'e', '<c-w><c-j>', { desc = 'Move down', nowait = true } },
      -- move windows
      { 'r', splits.swap_buf_left, { desc = 'Move window left', nowait = true } },
      { 't', splits.swap_buf_right, { desc = 'Move window right', nowait = true } },
      { 'f', splits.swap_buf_up, { desc = 'Move window up', nowait = true } },
      { 's', splits.swap_buf_down, { desc = 'Move window down', nowait = true } },
      { 'p', '<c-w>r', { desc = 'Rotate clockwise', nowait = true } },
      { 'w', '<c-w>R', { desc = 'Rotate counterclockwise', nowait = true } },
      { 'x', '<c-w>x', { desc = 'Swap with nth window', nowait = true } },
      -- resize
      { 'N', splits.resize_left, { desc = 'Resize left', nowait = true } },
      { 'I', splits.resize_right, { desc = 'Resize right', nowait = true } },
      { 'U', splits.resize_up, { desc = 'Resize up', nowait = true } },
      { 'E', splits.resize_down, { desc = 'Resize down', nowait = true } },
      -- split
      { 'h', '<c-w>s', { desc = 'Split horizontally', nowait = true } },
      { 'v', '<c-w>v', { desc = 'Split vertically', nowait = true } },
      { 'F', '<c-w>f', { desc = 'Split file under cursor', nowait = true } },
      { 'd', '<c-w>d', { desc = 'Split definition under cursor', nowait = true } },
      {
        'D',
        function()
          local file = vim.fn.input('file to diff: ')
          vim.cmd('vert diffsplit ' .. file)
        end,
        { desc = 'Right buffer', nowait = true },
      },
      -- kill
      { 'q', '<c-w>c', { desc = 'Close', nowait = true } },
      { 'Q', '<c-w>o', { desc = 'Close others', nowait = true } },
      { 'k', '<c-w>q', { desc = 'Kill', nowait = true } },
      -- buffers
      { 'l', '<cmd>bp<cr>', { desc = 'Left buffer', nowait = true } },
      { 'y', '<cmd>bn<cr>', { desc = 'Right buffer', nowait = true } },
      -- path
      {
        'c',
        function()
          local relative_path = vim.fn.expand('%') -- Get relative path
          vim.fn.setreg('"', relative_path)
          vim.fn.setreg('+', relative_path) -- Copy to system clipboard ('+' register)
          print('Copied relative path: ' .. relative_path)
        end,
        { desc = 'Copy relative path', nowait = true },
      },
      {
        'C',
        function()
          local absolute_path = vim.fn.expand('%:p') -- Get absolute path
          vim.fn.setreg('"', absolute_path)
          vim.fn.setreg('+', absolute_path) -- Copy to system clipboard ('+' register)
          print('Copied absolute path: ' .. absolute_path)
        end,
        { desc = 'Copy absolute path', nowait = true },
      },
      -- misc
      { '<leader>', '<leader>', { nowait = true, exit_before = true, remap = true } },
      { '<Esc>', nil, { nowait = true, exit = true } },
      { ':', ':', { nowait = true, exit_before = true } },
    },
    config = {
      invoke_on_body = true,
      color = 'amaranth',
      hint = { type = 'window', border = 'rounded' },
    },
  })
else
  print('Could not load Screen Mode hydra')
end
