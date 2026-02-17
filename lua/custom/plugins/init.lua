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

  -- Override treesitter config: disable auto_install (causes startup delay)
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.auto_install = false
      return opts
    end,
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
