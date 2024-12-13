-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- [[ Defined commands ]]
vim.api.nvim_create_user_command('Format', function()
  vim.lsp.buf.format({ async = false })
  if vim.filetype.match({ buf = vim.api.nvim_get_current_buf() }) == 'python' then
    vim.cmd('!ruff check % --fix --select I')
  end
end, { desc = 'format the document and sort imports' })

vim.api.nvim_create_user_command('Imports', function()
  if vim.filetype.match({ buf = vim.api.nvim_get_current_buf() }) == 'python' then
    vim.cmd('!ruff check % --select F401 --fix')
  end
end, { desc = 'format the document and sort imports' })

function Print(arg)
  print(vim.inspect(arg))
end
