return {
  'j-morano/buffer_manager.nvim',
  keys = {
    {
      '<leader>b',
      function()
        require('buffer_manager.ui').toggle_quick_menu()
      end,
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, 'BufferManagerModified', { fg = '#ffaaaa' })
    require('buffer_manager').setup({
      width = 0.8,
      -- short_file_names = false,
    })
  end,
  'mrjones2014/smart-splits.nvim',
}
