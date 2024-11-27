local vscode = require('vscode')

local set = vim.keymap.set
-- yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    --Trigger the vscode clipboard copy action after any yank unfortunatelly, only copies the first line
    require('vscode').action('editor.action.clipboardCopyAction')
  end,
})
-- lsp

set('n', '<leader>ld', function()
  vscode.action('editor.action.revealDefinition')
end, { desc = '[L]SP [D]efinitons' })

set('n', '<leader>lr', function()
  vscode.action('editor.action.goToReferences')
end, { desc = '[L]SP [R]eferences' })

set('n', '<leader>lR', function()
  vscode.action('editor.action.rename')
end, { desc = '[L]SP [R]eferences' })

set('n', 'h', function()
  vscode.action('editor.action.triggerParameterHints')
end, { desc = 'hints' })

set('n', 'H', function()
  vscode.action('editor.action.showHover')
end, { desc = 'Hover' })

set('n', '<leader>f', function()
  vscode.action('workbench.action.quickOpen')
end, { desc = 'Go to File' })

set('n', '<leader>p', function()
  vscode.action('workbench.action.quickOpen')
end, { desc = 'Go to File' })

set('n', 'N', function()
  vscode.action('workbench.action.quickOpen')
end, { desc = 'Go to File' })

set('n', '[d', function()
  vscode.action('editor.action.marker.prev')
end, { desc = 'prev action' })

set('n', ']d', function()
  vscode.action('editor.action.marker.next')
end, { desc = 'next action' })

set('n', 'gl', function()
  vscode.action('editor.action.marker.next')
end, { desc = 'next action' })
