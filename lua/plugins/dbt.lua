return {
  {
    "3fonov/dbt-nvim",
    config = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    ft = "sql",
    keys = {
      { "<leader>Dc", ":DbtCompile<CR>" },
      { "<leader>Dr", ":DbtRun<CR>" },
      { "<leader>DR", ":DbtRunFull<CR>" },
      { "<leader>Dt", ":DbtTest<CR>" },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
      { "<leader>D", false },
      { "<leader>Du", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
  },
}
