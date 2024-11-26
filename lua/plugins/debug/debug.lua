return {
  {
    -- STANDARD
    'mfussenegger/nvim-dap',
    dependencies = {
      'anuvyklack/hydra.nvim',
    },
    config = function()
      local dap = require('dap')

      local Hydra = require('hydra')

      Hydra({
        name = 'Debug Mode',
        mode = { 'n' },
        body = '<leader>d',
        config = {
          invoke_on_body = true,
          color = 'pink',
          hint = { border = 'rounded' },
        },
        heads = {
          -- :help dap-api
          -- runtime
          { 'c', dap.continue, { desc = 'Start/Continue', nowait = true } },
          { 'p', dap.pause, { desc = 'Pause', nowait = true } },
          { 'k', dap.terminate, { desc = 'Kill', nowait = true } },
          { 'L', dap.run_last, { desc = 'Run Last', nowait = true } },
          { 'R', dap.restart, { desc = 'Restart', nowait = true } },
          { 'K', dap.run_to_cursor, { desc = 'Run to Cursor, ignoring breakpoints', nowait = true } },

          -- movement
          { 'i', dap.step_over, { desc = 'Step Over', nowait = true } },
          { 'e', dap.step_into, { desc = 'Step Into', nowait = true } },
          { 'u', dap.step_out, { desc = 'Step Out', nowait = true } },
          { 'n', dap.step_back, { desc = 'Step Back', nowait = true } },

          -- stacktrace
          { 'E', dap.down, { desc = 'Down', nowait = true } },
          { 'U', dap.up, { desc = 'Up', nowait = true } },

          -- breakpoints
          { 'b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint', nowait = true } },
          {
            'B',
            function()
              dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end,
            { desc = 'Debug: Condition breakpoint', nowait = true },
          },
          {
            'h',
            function()
              require('dap').set_breakpoint(nil, vim.fn.input('Hit times: '))
            end,
            { desc = 'Debug: Hit breakpoint', nowait = true },
          },
          {
            'l',
            function()
              require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
            end,
            { desc = 'Debug: Log Point', nowait = true },
          },
          { 'C', dap.clear_breakpoints, { desc = 'Clear Breakpoints', nowait = true } },

          -- misc
          { 'r', dap.repl.toggle, { desc = 'REPL', nowait = true } },
          {
            'P',
            function()
              dap.set_log_level(vim.fn.input('Log Level (TRACE DEBUG INFO WARN ERROR): '))
            end,
            { desc = 'Debug: Log Level', nowait = true },
          },
        },
      })
    end,
  },
  -- install language specific adapters in language folder
}
