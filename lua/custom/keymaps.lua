-- Custom keymaps

-- Map <leader>Q to :q (prevent accidental shift+q)
vim.keymap.set({ 'n', 'x' }, '<leader>Q', ':q<CR>', { desc = 'Quit (same as :q)' })

-- Leader-based keymaps
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>w', ':wa<CR>', { desc = 'Write all' })
