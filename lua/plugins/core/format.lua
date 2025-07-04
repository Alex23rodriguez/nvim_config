return { -- Autoformat
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- format code
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader><leader>f',
        function()
          require('conform').format({ async = false, lsp_fallback = true })
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 5000,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'black', 'isort' },
        -- You can tell conform to run *until* a formatter is found.
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
