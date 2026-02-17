-- Custom keymaps

-- Map :Q to :q (prevent accidental shift+q - no leader needed)
vim.keymap.set({ 'n', 'x' }, 'Q', ':q<CR>', { desc = 'Quit (same as :q)' })

-- Leader-based keymaps
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>w', ':wa<CR>', { desc = 'Write all' })
