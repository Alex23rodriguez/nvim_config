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
          { 'c', dap.continue, { desc = 'Start/Continue', nowait = true } },
          { 'i', dap.step_over, { desc = 'Step Over', nowait = true } },
          { 'e', dap.step_into, { desc = 'Step Into', nowait = true } },
          { 'u', dap.step_out, { desc = 'Step Out', nowait = true } },
          { 'n', dap.step_back, { desc = 'Step Back', nowait = true } },

          { 'E', dap.down, { desc = 'Down', nowait = true } },
          { 'U', dap.step_back, { desc = 'Up', nowait = true } },

          { 'r', dap.repl.open, { desc = 'REPL', nowait = true } },
          { 'p', dap.pause, { desc = 'Pause', nowait = true } },
          { 'k', dap.terminate, { desc = 'Kill', nowait = true } },

          { 'b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint', nowait = true } },
          {
            'B',
            function()
              dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end,
            { desc = 'Debug: Set Breakpoint with condition', nowait = true },
          },
        },
      })
    end,
  },
  -- install language specific adapters in language folder
}
