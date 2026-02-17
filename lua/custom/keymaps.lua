-- Custom keymaps

-- Map :Q to :q (prevent accidental shift+q)
vim.keymap.set({ 'n', 'x' }, 'Q', ':q<CR>', { desc = 'Quit (same as :q)' })

-- Leader-based keymaps
vim.keymap.set('n', ',q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', ',w', ':wa<CR>', { desc = 'Write all' })
