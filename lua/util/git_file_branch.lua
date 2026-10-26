local M = {}

function M.pick()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return
  end

  local root = vim.fn.systemlist({
    "git",
    "-C",
    vim.fn.fnamemodify(path, ":h"),
    "rev-parse",
    "--show-toplevel",
  })[1]

  if not root or root == "" then
    vim.notify("Not inside a Git repository", vim.log.levels.ERROR)
    return
  end

  local relpath = vim.fs.relpath(root, path)
  if not relpath then
    return
  end

  local function git(args)
    return vim.fn.systemlist(vim.list_extend({ "git", "-C", root }, args))
  end

  local branches = git({
    "for-each-ref",
    "--sort=-committerdate",
    "--format=%(refname:short)",
    "refs/heads",
    "refs/remotes",
  })

  local choices = {}
  for _, branch in ipairs(branches) do
    local exists = vim.fn.system({
      "git",
      "-C",
      root,
      "cat-file",
      "-e",
      branch .. ":" .. relpath,
    })

    if vim.v.shell_error == 0 then
      table.insert(choices, branch)
    end
  end

  vim.ui.select(choices, {
    prompt = "Open " .. relpath .. " from branch:",
  }, function(branch)
    if not branch then
      return
    end

    local output = vim.fn.system({
      "git",
      "-C",
      root,
      "show",
      branch .. ":" .. relpath,
    })

    if vim.v.shell_error ~= 0 then
      vim.notify("Could not read file from " .. branch, vim.log.levels.ERROR)
      return
    end

    local lines = vim.split(output, "\n", { plain = true })
    if lines[#lines] == "" then
      table.remove(lines)
    end

    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.api.nvim_buf_set_name(buf, root .. "/" .. relpath .. "@" .. branch)
    vim.bo[buf].filetype = vim.bo.filetype
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "hide"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = false

    vim.api.nvim_set_current_buf(buf)
  end)
end

return M
