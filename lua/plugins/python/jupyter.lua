-- return {}
return {
  {
    'goerz/jupytext.vim',
    build = function()
      if vim.fn.executable('jupytext') ~= 1 then
        print("jupytext is not installed so won't be able to use jupytext.vim")
      end
    end,
    config = function()
      vim.api.nvim_set_var('jupytext_fmt', 'py:percent')
    end,
  },
  -- {
  --   'jupyter-vim/jupyter-vim',
  --   ft = 'python',
  --   config = function()
  --     -- vim.cmd("let g:jupyter_mapkeys = 0")
  --
  --     vim.keymap.set('n', '<leader>jj', '<cmd>JupyterConnect<CR>')
  --     vim.keymap.set('n', '<leader>jd', '<cmd>JupyterDisconnect<CR>')
  --     vim.keymap.set('n', '<leader>jf', '<cmd>JupyterRunFile<CR>')
  --
  --     vim.keymap.set('n', '<leader>c', '<cmd>JupyterSendCell<cr>')
  --     -- workaround send range in visual mode
  --     -- exits and enters visual mode to set '< and '>
  --     -- note that it also sets a mark in 'j, so may override whatever may be there
  --     vim.keymap.set('v', '<leader>c', "mjvv<cmd>'<,'>JupyterSendRange<cr>v'j")
  --   end,
  -- },
  -- { 'ahmedkhalf/jupyter-nvim', lazy = false },
  {
    'hkupty/iron.nvim',
    keys = {
      { '<leader>rr', '<cmd>IronRepl<cr>', desc = 'Toggle REPL' },
      { '<leader>rR', '<cmd>IronRestart<cr>', desc = 'Restart REPL' },
    },
    config = function()
      local iron = require('iron.core')
      iron.setup({
        config = {
          scratch_repl = true,
          repl_open_cmd = 'vertical botright 80 split',
        },
      })
    end,
  },
  {
    'Alex23rodriguez/NotebookNavigator.nvim',
    -- dir = '~/Documents/Misc/nvim_plugins/NotebookNavigator.nvim/',
    keys = {
      -- { "]h", function() require("notebook-navigator").move_cell "d" end },
      -- { "[h", function() require("notebook-navigator").move_cell "u" end },
      { '<leader>c', "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { '<leader>C', "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      'hkupty/iron.nvim', -- repl provider
      'nvimtools/hydra.nvim',
    },
    event = 'VeryLazy',
    opts = {
      activate_hydra_keys = '<leader>n', -- hydra head
      show_hydra_hint = false,
      hydra_keys = {
        comment = '/',
        run = 'c',
        run_and_move = 'C',
        move_up = 'u',
        move_down = 'e',
        add_cell_before = 'O',
        add_cell_after = 'o',
        merge_up = 'M',
        merge_down = 'm',
        swap_up = 'U',
        swap_down = 'E',
      },
    },
  },
  {
    'echasnovski/mini.hipatterns',
    event = 'VeryLazy',
    dependencies = { 'Alex23rodriguez/NotebookNavigator.nvim' },
    opts = function()
      local nn = require('notebook-navigator')

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  },
  {
    'echasnovski/mini.ai',
    event = 'VeryLazy',
    dependencies = { 'Alex23rodriguez/NotebookNavigator.nvim' },
    opts = function()
      local nn = require('notebook-navigator')

      -- defines a cell object `h`, can then dah, vih, yih ...
      local opts = { custom_textobjects = { h = nn.miniai_spec } }

      return opts
    end,
  },
}
