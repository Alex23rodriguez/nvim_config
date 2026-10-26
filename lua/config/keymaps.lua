-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")

-- jump to declaration in a vertical split
vim.keymap.set("n", "<leader>cv", function()
  vim.cmd("vsplit")
  vim.cmd("normal! gD")
end, { desc = "Declaration in vertical split" })

vim.keymap.set("n", "gt", function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })

vim.keymap.set("i", "<c-A>", "<End>", { desc = "Go go to end of line" })

vim.keymap.set("n", "<leader>gB", function()
  require("util.git_file_branch").pick()
end, { desc = "Open Current File from Branch" })
