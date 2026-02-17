# kickstart-modular.nvim - Personal Configuration

Forked from [dam9000/kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)

## Quick Start

```bash
# Install dependencies (macOS)
brew install neovim git ripgrep fd

# Optional: Nerd Font
brew install font-hack-nerd-font

# Clone this repo
git clone https://github.com/taasaa/kickstart-modular.nvim.git ~/.config/nvim

# Set up upstream remote for updates
cd ~/.config/nvim
git remote add upstream https://github.com/dam9000/kickstart-modular.nvim.git

# Start neovim - plugins install automatically
nvim
```

## Updates

```bash
cd ~/.config/nvim
git fetch upstream
git merge upstream/master
git push
```

---

## Customizations

All customizations are in `lua/custom/` - isolated from upstream for easy updates.

### Structure

```
lua/custom/
├── leader.lua      # Leader key, nerd font
├── options.lua    # Search settings
└── plugins/
    └── init.lua  # Custom plugins & overrides
```

### Leader Key

- **Leader:** `,` (comma)
- **Keybinding:** `<leader>,` - Telescope find_files

### Theme

- **Theme:** Tomorrow Night Bright
- **Font:** Nerd Font enabled

### Custom Plugins

| Plugin | Purpose |
|--------|---------|
| `nvim-neo-tree/neo-tree.nvim` | File tree |
| `folke/trouble.nvim` | Diagnostics list |
| `tpope/vim-surround` | Change surroundings |
| `tpope/vim-repeat` | Repeat plugin actions |
| `MeanderingProgrammer/render-markdown.nvim` | Markdown rendering |
| `folke/which-key.nvim` | Keybinding hints |

### Custom Keybindings

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>,` | Telescope find_files |
| `<leader>sf` | Telescope find_files |
| `<leader>xx` | Trouble diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Trouble symbols |
| `<leader>xr` | LSP references |

### Custom Settings

```lua
-- Leader & Font
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true

-- Search
vim.opt.hlsearch = true   -- Highlight matches
vim.opt.incsearch = true  -- Jump while typing
```

---

## Upstream Overrides

These override upstream defaults to fix bugs or customize behavior:

### Treesitter
- Fixed main module: `nvim-treesitter.config` (upstream has bug with `configs`)
- Disabled `auto_install` to prevent startup delay

### Tomorrow Night Bright
- Replaced tokyonight with tomorrow-night-bright theme

---

## LSP & Tools

Installed via Mason:
- `lua_ls` - Lua language server
- `stylua` - Lua formatter

Run `:Mason` to manage tools.

---

## Notes

- This config is based on kickstart-modular.nvim
- All customizations live in `lua/custom/`
- Upstream `lua/kickstart/` stays clean for easy merging
- Commit history preserved from fork
