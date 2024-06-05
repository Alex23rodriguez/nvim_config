return {
  'aserowy/tmux.nvim',
  config = function()
    require('tmux').setup({
      copy_sync = {
        enable = false,
      },
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = false,
        resize_step_x = 5,
        resize_step_y = 5,
      },
    })

    require('tmux.keymaps').register('n', {
      ['<A-n>'] = "<cmd>lua require('tmux').move_left()<cr>",
      ['<A-j>'] = "<cmd>lua require('tmux').move_right()<cr>",
      ['<A-u>'] = "<cmd>lua require('tmux').move_top()<cr>",
      ['<A-e>'] = "<cmd>lua require('tmux').move_bottom()<cr>",

      ['<AS-n>'] = "<cmd>lua require('tmux').resize_left()<cr>",
      ['<AS-j>'] = "<cmd>lua require('tmux').resize_right()<cr>",
      ['<AS-u>'] = "<cmd>lua require('tmux').resize_top()<cr>",
      ['<AS-e>'] = "<cmd>lua require('tmux').resize_bottom()<cr>",
    })
  end,
}
