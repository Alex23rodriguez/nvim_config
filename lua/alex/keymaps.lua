-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set

-- [[ Colemak movement ]]
-- hjkl
set('', 'u', 'k', { desc = 'Move up with u' })
set('', 'n', 'h', { desc = 'Move left with n' })
set('', 'e', 'j', { desc = 'Move down with e' })
set('n', 'i', 'l', { desc = 'Move right with i' }) -- keep visual mode as 'inside'

-- remap conflicts
set('n', '<CR>', 'i', { desc = 'Insert with enter' })
set('', 'j', 'e', { desc = 'Map j to end' })
set('', 'k', 'n', { desc = 'k for next in search' })
set('', 'K', 'N', { desc = 'K for previous in search' })

set('n', 'z', 'u', { desc = 'undo with z' })
set('n', 'Z', '<C-r>', { desc = 'redo with z' })

set('n', 'S', 'z', { desc = 'Vim z prefix' })

--

-- [[ Window management ]]
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- set('n', '<A-e>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- set('n', '<A-u>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- set('n', '<A-n>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- set('n', '<A-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- set('n', '<A-j>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

set('n', 's', '<c-w>', { desc = 'window management' })
set('n', 'sx', '<c-w>x', { desc = 'Swap window with nth window' })
set('n', 'sh', '<c-w>s', { desc = 'Split window horizontally' })
set('n', 'sv', '<c-w>v', { desc = 'Split window vertically' }) -- redundant
set('n', 'sd', '<c-w>d', { desc = 'Split and go to definition' }) -- redundant
set('n', 'sgt', '<c-w>gt', { desc = 'Go to next tab' }) -- redundant
set('n', 'sgT', '<c-w>gT', { desc = 'Go to previous tab' }) -- redundant
set('n', 'sO', '<c-w>o', { desc = 'Close all but current window' })
set('n', 'sq', '<c-w>q', { desc = ':q' }) -- redundant
set('n', 'sz', '<c-w>z', { desc = 'Close preview window' }) -- redundant

-- Alternative (for when ctrl is not going through the app)
-- set('n', 'sE', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- set('n', 'sU', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- set('n', 'sN', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- set('n', 'sI', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- [[ Buffer management ]]
set('n', 'ss', '<cmd>b#<CR>', { desc = 'Switch to previous buffer' })
set('n', 'sn', '<cmd>bp<CR>', { desc = 'Left buffer' })
set('n', 'si', '<cmd>bn<CR>', { desc = 'Right buffer' })
set('n', 'sw', '<cmd>bd<CR>', { desc = 'Close all but current buffer' })
set('n', 'sW', '<cmd>%bd|e#<CR>', { desc = 'Close all but current buffer' })

-- [[ Quickfix ]]
set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next Quickfix item' })
set('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous Quickfix item' })
--
-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', 'gl', '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Set buffer diagnostics to location list' })

-- Function to toggle the quickfix window
set('n', 'qq', function()
  if vim.api.nvim_get_option_value('filetype', {}) == 'qf' then
    -- Close the quickfix window
    vim.cmd('cclose')
  else
    -- Open the quickfix window
    vim.cmd('copen')
  end
end, { desc = 'Toggle Quickfix' })

-- [[ Misc ]]
set('v', '<', '<gv', { desc = 'Stay in visual mode when indenting' })
set('v', '>', '>gv', { desc = 'Stay in visual mode when indenting' })

-- when pasting over something, don't override register
set('v', 'p', '"_dP', { desc = 'Visual paste does not override register' })
--
--  clear highlight on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
