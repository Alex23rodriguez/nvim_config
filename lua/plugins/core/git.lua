-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  lazy = false,

  keys = {
    {
      '<leader>Gb',
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      desc = 'Git blame line',
    },
    -- {
    --   '<leader>Gh',
    --   function()
    --     require('gitsigns').preview_hunk()
    --   end,
    --   desc = 'Git view hunk',
    -- },
    {
      '<leader>Gd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = 'Git diff',
    },
    {
      '<leader>GB',
      function()
        require('telescope.builtin').git_branches()
      end,
      desc = 'Git branches',
    },
    {
      '<leader>Gc',
      function()
        require('telescope.builtin').git_commits()
      end,
      desc = 'Git commits',
    },
    -- {
    --   '<leader>Gh',
    --   function()
    --     require('telescope.builtin').git_bcommits()
    --   end,
    --   desc = 'Git buffer history',
    -- },
    {
      '<leader>Gh',
      function()
        require('telescope.builtin').git_bcommits({
          previewer = require('telescope.previewers').new_termopen_previewer({
            dyn_title = function(_, entry)
              return entry.value
            end, -- use hash as title
            get_command = function(entry, status)
              local hash = entry.value
              local cmd = {
                'git show ' .. hash,
                '--color=always',
              }
              return table.concat(cmd, ' ')
            end,
          }),
        })
      end,
      desc = 'Git buffer history',
    },
  },

  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
