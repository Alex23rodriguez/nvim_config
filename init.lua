if vim.g.vscode then
  require('myvscode.keymaps')
else
  require('alex.options')
  require('alex.keymaps')
  require('alex.commands')
  require('alex.misc')
  require('alex.lazy')
end
