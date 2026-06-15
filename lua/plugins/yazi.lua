return {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    cond = vim.fn.executable("yazi") == 1,
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      { "<leader>e", "<cmd>Yazi<cr>", desc = "Yazi" },
      { "<leader>E", "<cmd>Yazi cwd<cr>", desc = "Yazi cwd" },
    },
    opts = {},
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
}
