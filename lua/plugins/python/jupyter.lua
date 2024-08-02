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
}
