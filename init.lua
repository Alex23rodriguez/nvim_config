if vim.g.vscode then
  require('myvscode.keymaps')
  require('myvscode.vs_keymaps')
  require('myvscode.commands')
  require('myvscode.lazy')
else
  require('alex.options')
  require('alex.keymaps')
  require('alex.commands')
  require('alex.misc')
  require('alex.lazy')
  require('alex.hydras')
end
