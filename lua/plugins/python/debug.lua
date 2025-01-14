return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  config = function()
    local dap_python = require('dap-python')
    -- setup takes a python executable with debugpy installed
    -- will respect venv
    require('dap').configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch from directory',
        program = '${file}',
        cwd = function()
          return vim.fn.input('Basepath: ', vim.fn.getcwd(), 'dir')
        end,
      },
    }
    dap_python.setup('python')
  end,
}
