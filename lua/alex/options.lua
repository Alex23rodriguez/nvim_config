-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time (affects cursor hold)
vim.opt.updatetime = 1000

-- Decrease mapped sequence wait time
-- Delay for which key
vim.opt.timeoutlen = 1000

-- Configure how new splits should be opened
-- force all vertical splits to go to the right of current window
vim.opt.splitright = true
-- force all horizontal splits to go below current window
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set highlight on search
vim.opt.hlsearch = true

-- Disable backup and swap file
vim.opt.backup = false
vim.opt.swapfile = false
--
-- convert tabs to spaces
vim.opt.expandtab = true
--
-- Display lines as one long line
vim.opt.wrap = false

-- set relative numbered lines
vim.opt.relativenumber = true

-- num of options to show on a menu
vim.opt.pumheight = 10

-- command line height
-- vim.opt.cmdheight = 2

-- wildcard mode up to common prefix
vim.opt.wildmode = 'longest:full,full'
