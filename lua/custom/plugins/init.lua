-- Custom plugin configurations
-- These override the default kickstart configurations

-- Helper function to get absolute path of selected node in neo-tree
local function get_neo_tree_node_path()
  local ok, neo_tree = pcall(require, 'neo-tree')
  if not ok then
    return nil
  end
  local manager = require('neo-tree.sources.manager')
  local state = manager.get_state('filesystem')
  if state and state.current then
    return state.current.path
  end
  return nil
end

-- Custom command: Copy absolute path to clipboard
vim.api.nvim_create_user_command('CopyAbsolutePath', function()
  local path = vim.fn.expand('%:p')
  if path and path ~= '' then
    vim.fn.setreg('+', path)
    vim.fn.setreg('"', path)
    vim.notify('Copied: ' .. path, vim.log.levels.INFO)
  else
    vim.notify('No file path found', vim.log.levels.WARN)
  end
end, {})

-- Custom command: Reveal current file in Finder
vim.api.nvim_create_user_command('RevealInFinder', function()
  local path = vim.fn.expand('%:p')
  if path and path ~= '' then
    vim.fn.system('open -R "' .. path .. '"')
    vim.notify('Revealed in Finder: ' .. path, vim.log.levels.INFO)
  else
    vim.notify('No file path found', vim.log.levels.WARN)
  end
end, {})

return {
  -- Custom keybinding for Neo-tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle File Explorer', silent = true },
    },
    opts = {
      window = {
        width = 30,
        mappings = {
          ['<right>'] = 'open',           -- right arrow opens folder
          ['<left>'] = 'navigate_up',     -- left arrow goes to parent
          ['h'] = 'navigate_up',          -- h also goes to parent (vim-style)
          ['l'] = 'open',                 -- l opens (vim-style)
          ['y'] = 'none',                 -- disable default y (copy filename)
          ['yp'] = function(state)
            local node = state.tree:get_node()
            if node then
              local path = node.path
              vim.fn.setreg('+', path)
              vim.fn.setreg('"', path)
              vim.notify('Copied path: ' .. path, vim.log.levels.INFO)
            end
          end,
          ['yn'] = function(state)
            local node = state.tree:get_node()
            if node then
              local name = node.name
              vim.fn.setreg('+', name)
              vim.fn.setreg('"', name)
              vim.notify('Copied name: ' .. name, vim.log.levels.INFO)
            end
          end,
          ['go'] = function(state)
            local node = state.tree:get_node()
            if node then
              local path = node.path
              vim.fn.system('open -R "' .. path .. '"')
              vim.notify('Revealed in Finder: ' .. path, vim.log.levels.INFO)
            end
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- show hidden files by default
        },
      },
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

  -- Comment.nvim - Smart commenting
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Comment toggle' },
      { 'gcc', desc = 'Comment line toggle' },
    },
    opts = {
      mappings = {
        basic = true,
        extra = true,
      },
    },
  },

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
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'List Buffers' })
    end,
  },

  -- Session manager - auto-save/restore per project
  {
    'Shatur/neovim-session-manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    config = function()
      local session_manager = require('session_manager')
      session_manager.setup({
        autoload_last_session = true,
        sessions_dir = vim.fn.stdpath('data') .. '/sessions/',
        session_filetype_whitelist = { 'lua', 'python', 'json', 'sh', 'yaml', 'yml', 'toml', 'md', 'txt' },
      })
    end,
    keys = {
      { '<leader>sl', '<cmd>SessionManager load_session<cr>', desc = 'Load Session' },
      { '<leader>ss', '<cmd>SessionManager save_current_session<cr>', desc = 'Save Session' },
    },
  },
}
