-- Screen mode
local Hydra = require('hydra')
local success, splits = pcall(require, 'smart-splits')
if success then
  Hydra({
    name = 'Screen Mode',
    mode = 'n',
    body = 'S',
    config = {
      invoke_on_body = true,
      color = 'amaranth',
      hint = { type = 'window', border = 'rounded' },
    },
    heads = {
      -- move between windows
      { 'n', '<c-w><c-h>', { desc = 'Move left', nowait = true } },
      { 'i', '<c-w><c-l>', { desc = 'Move right', nowait = true } },
      { 'u', '<c-w><c-k>', { desc = 'Move up', nowait = true } },
      { 'e', '<c-w><c-j>', { desc = 'Move down', nowait = true } },
      -- move windows
      { 'r', splits.swap_buf_left, { desc = 'Move window left', nowait = true } },
      { 't', splits.swap_buf_right, { desc = 'Move window right', nowait = true } },
      { 'f', splits.swap_buf_up, { desc = 'Move window up', nowait = true } },
      { 's', splits.swap_buf_down, { desc = 'Move window down', nowait = true } },
      { 'p', '<c-w>r', { desc = 'Rotate clockwise', nowait = true } },
      { 'w', '<c-w>R', { desc = 'Rotate counterclockwise', nowait = true } },
      { 'x', '<c-w>x', { desc = 'Swap with nth window', nowait = true } },
      -- resize
      { 'N', splits.resize_left, { desc = 'Resize left', nowait = true } },
      { 'I', splits.resize_right, { desc = 'Resize right', nowait = true } },
      { 'U', splits.resize_up, { desc = 'Resize up', nowait = true } },
      { 'E', splits.resize_down, { desc = 'Resize down', nowait = true } },
      -- split
      { 'h', '<c-w>s', { desc = 'Split horizontally', nowait = true } },
      { 'v', '<c-w>v', { desc = 'Split vertically', nowait = true } },
      { 'F', '<c-w>f', { desc = 'Split file under cursor', nowait = true } },
      { 'd', '<c-w>d', { desc = 'Split definition under cursor', nowait = true } },
      {
        'D',
        function()
          local file = vim.fn.input('file to diff: ')
          vim.cmd('vert diffsplit ' .. file)
        end,
        { desc = 'Right buffer', nowait = true },
      },
      -- kill
      { 'q', '<c-w>c', { desc = 'Close', nowait = true } },
      { 'Q', '<c-w>o', { desc = 'Close others', nowait = true } },
      { 'k', '<c-w>q', { desc = 'Kill', nowait = true } },
      -- buffers
      { 'l', '<cmd>bp<cr>', { desc = 'Left buffer', nowait = true } },
      { 'y', '<cmd>bn<cr>', { desc = 'Right buffer', nowait = true } },
      -- path
      {
        'c',
        function()
          local relative_path = vim.fn.expand('%') -- Get relative path
          vim.fn.setreg('"', relative_path)
          vim.fn.setreg('+', relative_path) -- Copy to system clipboard ('+' register)
          print('Copied relative path: ' .. relative_path)
        end,
        { desc = 'Copy relative path', nowait = true },
      },
      {
        'C',
        function()
          local absolute_path = vim.fn.expand('%:p') -- Get absolute path
          vim.fn.setreg('"', absolute_path)
          vim.fn.setreg('+', absolute_path) -- Copy to system clipboard ('+' register)
          print('Copied absolute path: ' .. absolute_path)
        end,
        { desc = 'Copy absolute path', nowait = true },
      },
      -- misc
      { '<leader>', '<leader>', { nowait = true, exit_before = true, remap = true } },
      { '<Esc>', nil, { nowait = true, exit = true } },
      { ':', ':', { nowait = true, exit_before = true } },
    },
  })
else
  print('Could not load Screen Mode hydra')
end

-- DAP
local dap, dapui
success, dap = pcall(require, 'dap')
if success then
  success, dapui = pcall(require, 'dapui')
end
if success then
  success, virtual_text = pcall(require, 'nvim-dap-virtual-text')
end
if success then
  success, persistent_breakpoints = pcall(require, 'persistent-breakpoints.api')
end
if success then
  Hydra({
    name = 'Debug Mode',
    mode = { 'n' },
    body = '<leader>d',
    hint = [[Runtime:
_d_: Start/Continue         _P_: Pause                  _K_, _q_: Kill
_L_: Run Last               _R_: Restart
Movement:
_i_: Step Over              _e_: Step Into              _u_: Step Out
_n_: Step Back              _E_: Stack Down             _U_: Stack Up
_k_: Run Till Cursor
Breakpoints:
_b_: Toggle Breakpoint      _c_: Condition Breakpoint   _h_: Hit Breakpoint
_p_: Log Point              _C_: Clear Breakpoints
GUI:
_g_: Toggle GUI             _l_: Toggle log layout      _y_: Toggle vars layout
_v_: Toggle virtual text
Misc:
_w_: Print Level            _<Esc>_: cancel]],
    config = {
      invoke_on_body = true,
      color = 'teal', -- foreign keys warn and continue the state
      -- foreign_keys = 'warn',
      hint = { type = 'window', border = 'rounded', position = 'middle-right' },
      nowait = true,
    },
    heads = {
      -- :help dap-api
      -- runtime
      { 'd', dap.continue, { desc = 'Start/Continue' } },
      { 'P', dap.pause, { desc = 'Pause' } },
      { 'K', dap.terminate, { desc = 'Kill' } },
      { 'q', dap.terminate, { desc = 'Kill' } },
      { 'L', dap.run_last, { desc = 'Run Last' } },
      { 'R', dap.restart, { desc = 'Restart' } },
      { 'k', dap.run_to_cursor, { desc = 'Run to Cursor, ignoring breakpoints' } },

      -- movement
      { 'i', dap.step_over, { desc = 'Step Over' } },
      { 'e', dap.step_into, { desc = 'Step Into' } },
      { 'u', dap.step_out, { desc = 'Step Out' } },
      { 'n', dap.step_back, { desc = 'Step Back' } },

      -- stacktrace
      { 'E', dap.down, { desc = 'Down' } },
      { 'U', dap.up, { desc = 'Up' } },

      -- breakpoints
      -- { 'b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' } },
      { 'b', persistent_breakpoints.toggle_breakpoint, { desc = 'Toggle Breakpoint' } },
      {
        'c',
        persistent_breakpoints.set_conditional_breakpoint,
        -- function()
        -- dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        -- end,
        { desc = 'Condition breakpoint' },
      },
      {
        'h',
        function()
          require('dap').set_breakpoint(nil, vim.fn.input('Hit times: '))
        end,
        { desc = 'Hit breakpoint' },
      },
      {
        'p',
        persistent_breakpoints.set_log_point,
        -- function()
        -- dap.set_breakpoint(nil, nil, vim.fn.input('Log point message {var}: '))
        -- end,
        { desc = 'Log Point' },
      },
      -- { 'C', dap.clear_breakpoints, { desc = 'Clear Breakpoints' } },
      { 'C', persistent_breakpoints.clear_all_breakpoints, { desc = 'Clear Breakpoints' } },

      -- dapui
      -- eval
      --
      {
        'y',
        function()
          dapui.toggle({ layout = 1 })
        end,
        { desc = 'Toggle vars layout' },
      },
      {
        'l',
        function()
          dapui.toggle({ layout = 2 })
        end,
        { desc = 'Toggle logs layout' },
      },

      { 'g', dapui.toggle, { desc = 'toggle gui' } },

      -- virtual text
      { 'v', virtual_text.toggle, { desc = 'toggle gui' } },

      -- misc
      {
        'w',
        function()
          dap.set_log_level(vim.fn.input('Log Level (TRACE DEBUG INFO WARN ERROR): '))
        end,
        { desc = 'Log Level' },
      },
      { '<Esc>', nil, { exit = true } },
    },
  })
end
