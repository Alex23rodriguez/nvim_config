return {
  {
    -- STANDARD
    'mfussenegger/nvim-dap',
    dependencies = {
      'anuvyklack/hydra.nvim',
    },
    config = function()
      local dap = require('dap')

      hydra_heads = {
        -- :help dap-api
        -- runtime
        { 'd', dap.continue, { desc = 'Start/Continue', nowait = true } },
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
          'c',
          function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
          end,
          { desc = 'Condition breakpoint', nowait = true },
        },
        {
          'h',
          function()
            require('dap').set_breakpoint(nil, vim.fn.input('Hit times: '))
          end,
          { desc = 'Hit breakpoint', nowait = true },
        },
        {
          'l',
          function()
            require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
          end,
          { desc = 'Log Point', nowait = true },
        },
        { 'C', dap.clear_breakpoints, { desc = 'Clear Breakpoints', nowait = true } },

        -- misc
        { 'r', dap.repl.toggle, { desc = 'REPL', nowait = true } },
        {
          'P',
          function()
            dap.set_log_level(vim.fn.input('Log Level (TRACE DEBUG INFO WARN ERROR): '))
          end,
          { desc = 'Log Level', nowait = true },
        },
      }

      local Hydra = require('hydra')
      Hydra({
        name = 'Debug Mode',
        mode = { 'n' },
        body = '<leader>d',
        hint = [[Runtime:
  _d_: Start/Continue         _p_: Pause                  _k_: Kill
  _L_: Run Last               _R_: Restart                _K_: Run Till Cursor
Movement:
  _i_: Step Over              _e_: Step Into              _u_: Step Out
  _n_: Step Back              _E_: Down                   _U_: Up
Breakpoints:
  _b_: Toggle Breakpoint      _c_: Condition Breakpoint   _h_: Hit Breakpoint
  _l_: Log Point              _C_: Clear Breakpoints
Misc:
  _r_: REPL                   _P_: Print Level]],
        config = {
          invoke_on_body = true,
          color = 'pink',
          hint = { type = 'window', border = 'rounded', position = 'middle-right' },
        },
        heads = hydra_heads,
      })
    end,
  },
  -- install language specific adapters in language folder
}
