return {
  {
    "3fonov/dbt-nvim",
    config = true,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    ft = "sql",
    keys = {
      { "<leader>Dc", ":DbtCompile<CR>", desc = "dbt Compile" },
      { "<leader>Dr", ":DbtRun<CR>", desc = "dbt Run current model" },
      { "<leader>DR", ":DbtRunFull<CR>", desc = "dbt Run current model (full)" },
      { "<leader>Dt", ":DbtTest<CR>", desc = "dbt Test" },
      { "<leader>DU", ":DbtListUpstreamModels<CR>", desc = "dbt List upstream models" },
      { "<leader>DD", ":DbtListDownstreamModels<CR>", desc = "dbt List downstream models" },
      { "<leader>Dy", ":DbtModelYaml<CR>", desc = "dbt Generate yaml for current model" },
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
