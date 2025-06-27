return {
  -- Telescope
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Useful for getting pretty icons, but requires a Nerd Font.
    -- { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    { 'nvim-tree/nvim-web-devicons', enabled = true },

    -- [[ PLUGINS ]]
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup({
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'harpoon')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'flutter')
    local success, _ = pcall(require('telescope').load_extension, 'yank_history')
    if success then
      vim.keymap.set('n', '<leader>ty', function()
        vim.cmd('Telescope yank_history')
      end, { desc = '[T]elescope [Y]anks' })
    end

    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    -- Telescope
    vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[T]elescope [H]elp' })
    vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[T]elescope [K]eymaps' })

    vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[T]elescope [F]iles' })
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[T]elescope [F]iles' })

    vim.keymap.set('n', '<leader>tF', function()
      builtin.find_files({ hidden = true })
    end, { desc = '[T]elescope [F]iles (hidden=true)' })
    vim.keymap.set('n', '<leader>tt', function()
      builtin.builtin(themes.get_dropdown({ previewer = false }))
    end, { desc = '[T]elescope [S]elect Telescope' })
    vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[T]elescope current [W]ord' })

    vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[T]elescope by [G]rep' })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = '[T]elescope by [G]rep' })

    vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[T]elescope [D]iagnostics' })
    vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = '[T]elescope [R]esume' })

    vim.keymap.set('n', '<leader>tp', function()
      builtin.oldfiles({ only_cwd = true, no_ignore = true })
    end, { desc = '[T]elescope Recent Files' })
    vim.keymap.set('n', '<leader>p', function()
      builtin.oldfiles({ only_cwd = true, no_ignore = true })
    end, { desc = '[T]elescope Recent Files' })

    vim.keymap.set('n', '<leader>t.', builtin.oldfiles, { desc = '[T]elescope Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = '[T]elescope [B]uffers' })
    vim.keymap.set('n', "<leader>t'", builtin.marks, { desc = '[T]elescope [M]arks' })
    vim.keymap.set('n', '<leader>t?', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = '[?] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>t/', function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end, { desc = '[T]elescope [/] in Open Files' })
    vim.keymap.set('n', '<leader>tn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end, { desc = '[T]elescope [N]eovim files' })
  end,
}
