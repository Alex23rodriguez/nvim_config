vim.api.nvim_create_user_command("DatabricksConnect", function()
  vim.ui.input({ prompt = "Databricks profile: " }, function(profile)
    profile = profile ~= "" and profile or "DEFAULT"

    local code = string.format(
      [[
from databricks.connect import DatabricksSession
spark = DatabricksSession.builder.profile("%s").getOrCreate()
      ]],
      profile
    )

    require("iron.core").send(nil, code)
  end)
end, {})
