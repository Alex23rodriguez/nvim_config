return {
  'mikavilpas/yazi.nvim',
  lazy = false,
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      'N',
      mode = { 'n' },
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      -- Open in the current working directory
      '-',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
    -- {
    --   "<c-up>",
    --   "<cmd>Yazi toggle<cr>",
    --   desc = "Resume the last yazi session",
    -- },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = '?',
      change_working_directory = '_',
    },
  },
  init = function()
    -- mark netrw as loaded so it's not loaded at all. (recommended if open_for_directories)
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
