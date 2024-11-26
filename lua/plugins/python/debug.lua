return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  config = function()
    local dap_python = require('dap-python')
    -- setup takes a python executable with debugpy installed
    -- will respect venv
    dap_python.setup('python')
  end,
}
