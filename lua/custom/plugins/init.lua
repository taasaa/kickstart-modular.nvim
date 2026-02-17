-- Custom plugin configurations
-- These override the default kickstart configurations

return {
  -- Custom keybinding for Neo-tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle File Explorer', silent = true },
    },
  },

  -- Override treesitter: fix main module (upstream has bug: configs vs config)
  {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.config',
    opts = {
      auto_install = false,
    },
  },

  -- Tomorrow Night Bright theme
  {
    'chriskempson/vim-tomorrow-theme',
    config = function()
      vim.cmd.colorscheme 'tomorrow-night-bright'
    end,
  },

  -- Trouble.nvim - Diagnostics list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>xr', '<cmd>Trouble lsp toggle<cr>', desc = 'References (Trouble)' },
    },
  },

  -- vim-surround - Change surroundings
  { 'tpope/vim-surround' },

  -- vim-repeat - Repeat plugin actions
  { 'tpope/vim-repeat' },

  -- render-markdown - Render markdown in neovim
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  -- Custom keybindings
  {
    'folke/which-key.nvim',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>,', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find Files' })
    end,
  },
}
