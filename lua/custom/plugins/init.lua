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

  -- Override LSP config: disable mason-tool-installer (registry sync issues)
  {
    'williamboman/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {},
      auto_update = false,
    },
  },
}
