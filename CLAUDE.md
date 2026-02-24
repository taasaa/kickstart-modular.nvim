# Neovim Config

This is a Neovim configuration directory using the Kickstart nvim config as a base with custom overrides in `lua/custom/`.

## IMPORTANT

**ALL user customizations MUST go in `lua/custom/` — NEVER modify `lua/kickstart/` directly.**

User customizations belong in:
- `lua/custom/plugins/init.lua` — plugin configs
- `lua/custom/options.lua` — vim options
- `lua/custom/keymaps.lua` — keybindings
- `lua/custom/leader.lua` — leader key settings
