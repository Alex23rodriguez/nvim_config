_OIL_MARKS = {}
return {
  'stevearc/oil.nvim',
  lazy = false,
  keys = {
    {
      'N',
      function()
        local oil = require('oil')
        oil.open()
        -- Wait until oil has opened, for a maximum of 1 second.
        -- vim.wait(1000, function()
        --   return oil.get_cursor_entry() ~= nil
        -- end)
        -- if oil.get_cursor_entry() then
        --   oil.open_preview()
        -- end
      end,
      desc = 'Open parent directory',
    },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    keymaps = {
      -- ['<Esc>'] = 'actions.close',
      ['<CR>'] = 'actions.select',
      ['S'] = 'actions.change_sort',
      ['N'] = 'actions.close',
      ['R'] = 'actions.refresh',
      ['P'] = 'actions.preview',
      ['X'] = 'actions.open_cmdline',
      ['T'] = 'actions.open_terminal',
      ['Y'] = 'actions.preview_scroll_down',
      ['L'] = 'actions.preview_scroll_up',
      ['g?'] = 'actions.show_help',
      ['gv'] = {
        function()
          require('oil').set_columns({
            { 'permissions', highlight = '@attribute' },
            { 'mtime', format = '%Y-%m-%d %H:%M', highlight = '@function' },
            { 'size', highlight = '@keyword' },
            'icon',
          })
        end,
        desc = 'View: verbose',
      },
      -- sorting and view options
      ['gn'] = {
        function()
          require('oil').set_columns({ 'icon' })
          require('oil').set_sort({ { 'type', 'asc' } })
        end,
        desc = 'View: normal',
      },
      ['gs'] = {
        function()
          require('oil').set_columns({ { 'size', highlight = '@keyword' }, 'icon' })
          require('oil').set_sort({ { 'type', 'asc' }, { 'size', 'desc' } })
        end,
        desc = 'View: size',
      },
      ['gm'] = {
        function()
          require('oil').set_columns({
            { 'mtime', format = 'mod: %Y-%m-%d %H:%M', highlight = '@function' },
            'icon',
          })
          require('oil').set_sort({ { 'type', 'asc' }, { 'mtime', 'desc' } })
        end,
        desc = 'View: modified',
      },
      ['gc'] = {
        function()
          require('oil').set_columns({
            { 'ctime', format = 'created: %Y-%m-%d %H:%M', highlight = '@function' },
            'icon',
          })
          require('oil').set_sort({ { 'type', 'asc' }, { 'ctime', 'desc' } })
        end,
        desc = 'View: created',
      },
      ['ga'] = {
        function()
          require('oil').set_columns({
            { 'atime', format = 'accessed: %Y-%m-%d %H:%M', highlight = '@function' },
            'icon',
          })
          require('oil').set_sort({ { 'type', 'asc' }, { 'atime', 'desc' } })
        end,
        desc = 'View: accessed',
      },
      -- marks
      ['m'] = {
        function()
          local mark = vim.fn.input('save as: ')
          if string.len(mark) ~= nil then
            _OIL_MARKS[mark] = require('oil').get_current_dir()
            print("saved '" .. mark .. "'")
          end
        end,
        desc = 'Mark: save current directory',
      },
      ['M'] = {
        function()
          vim.notify(vim.inspect(_OIL_MARKS))
        end,
        desc = 'Mark: list',
      },
      ["'"] = {
        function()
          local mark = vim.fn.input('load: ')
          if _OIL_MARKS[mark] ~= nil then
            require('oil').open(_OIL_MARKS[mark])
          else
            print("'" .. mark .. "' not found")
          end
        end,
        desc = 'Mark: open directory',
      },
    },
    view_options = { show_hidden = true },
  },
}
