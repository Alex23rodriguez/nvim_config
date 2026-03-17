return {
  -- AVANTE
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   opts = {
  --     -- provider = 'lmstudio',
  --     -- vendors = {
  --     --   lmstudio = {
  --     --     __inherited_from = 'openai',
  --     --     api_key_name = '',
  --     --     endpoint = 'http://127.0.0.1:1234/v1',
  --     --     model = 'qwen2.5-7b-instruct-1m',
  --     --   },
  --     -- },
  --     mappings = {
  --       ask = '<leader>aa', -- ask
  --       edit = '<leader>ae', -- edit
  --       refresh = '<leader>ar', -- refresh
  --       chat = '<leader>ac', -- chat
  --     },
  --   },
  --
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'echasnovski/mini.pick', -- for file_selector provider mini.pick
  --     'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  --     'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --     'ibhagwan/fzf-lua', -- for file_selector provider fzf
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },

  -- GP.NVIM
  {
    'robitx/gp.nvim',
    config = function()
      local conf = {
        providers = {
          ollama = {
            disable = true,
            endpoint = 'http://127.0.0.1:1234/v1',
            secret = 'dummy_secret',
          }, -- For customization, refer to Install > Configuration in the Documentation/Readme
        },
      }
      require('gp').setup(conf)

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },
  {
    -- adds inline suggestions to neovim
    -- check out augmentcode.com
    'augmentcode/augment.vim',
    lazy = true,
    init = function()
      vim.api.nvim_set_var('augment_disable_tab_mapping', true)
    end,
    keys = {
      { '<C-y>', '<cmd>call augment#Accept()<cr>', mode = 'i' },
    },
  },
}
