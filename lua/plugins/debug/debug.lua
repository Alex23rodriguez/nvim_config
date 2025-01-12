return {
  {
    -- STANDARD
    'mfussenegger/nvim-dap',
  },
  -- keymaps defined in hydras.lua
  -- install language specific adapters in language folder

  -- virtual text
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = { commented = true, virt_text_pos = 'eol' },
    -- config = true,
  },
}
