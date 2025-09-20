return {
  {
    -- adds inline suggestions to neovim
    -- check out augmentcode.com
    'augmentcode/augment.vim',
    lazy = true,
    init = function()
      vim.api.nvim_set_var('augment_disable_tab_mapping', true)
    end,
    keys = {
      { '<C-y>', '<cmd>call augment#Accept()<cr>', mode = 'i' },
    },
  },
}
