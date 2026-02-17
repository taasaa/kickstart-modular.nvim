-- Custom keymaps

-- Map :Q to :q (prevent accidental shift+q)
vim.keymap.set({ 'n', 'x' }, 'Q', ':q<CR>', { desc = 'Quit (same as :q)' })
