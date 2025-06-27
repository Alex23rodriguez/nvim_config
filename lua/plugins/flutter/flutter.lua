return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  opts = { lsp = { color = { enabled = true, background = true, virtual_text = false } } },
  keys = {
    { '<leader>FF', '<cmd>FlutterRun<cr>' },
    { '<leader>FD', '<cmd>FlutterDebug<cr>' },
    { '<leader>FR', '<cmd>FlutterRestart<cr>' },
    { '<leader>Fd', '<cmd>FlutterDevices<cr>' },
    { '<leader>Fr', '<cmd>FlutterReload>' },
    { '<leader>Fl', '<cmd>FlutterLogToggle<cr>' },
    { '<leader>Fk', '<cmd>FlutterQuit<cr>' },
    { '<leader>Fq', '<cmd>FlutterQuit<cr>' },
    { '<leader>Fo', '<cmd>FlutterOutlineToggle<cr>' },
  },
}
