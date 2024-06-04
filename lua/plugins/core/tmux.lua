return {
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup({
      copy_sync = {
        enable = false,
      },
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {
        enable_default_keybindings = false,
      },
    })

    local tmux = require("tmux")

    require("tmux.keymaps").register("n", {
      ["<C-n>"] = tmux.move_left,
      ["<C-e>"] = tmux.move_bottom,
      ["<C-u>"] = tmux.move_top(),
      ["<C-j>"] = tmux.move_right(),

      ["<C-l>"] = tmux.resize_left(),
      ["<C-y>"] = tmux.resize_right(),
      ["<A-l>"] = tmux.resize_top(),
      ["<A-y>"] = tmux.resize_bottom(),
    })
  end
}
