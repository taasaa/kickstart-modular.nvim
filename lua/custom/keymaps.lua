-- Custom keymaps

-- Map :Q to :q (prevent accidental shift+q - no leader needed)
vim.keymap.set({ 'n', 'x' }, 'Q', ':q<CR>', { desc = 'Quit (same as :q)' })

-- Comment toggle with Cmd+/ (macOS)
vim.keymap.set('n', '<D-/>', 'gcc', { desc = 'Toggle comment' })
vim.keymap.set('v', '<D-/>', 'gc', { desc = 'Toggle comment' })

-- Leader-based keymaps
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>w', ':wa<CR>', { desc = 'Write all' })
vim.keymap.set('n', '<leader>x', ':wa<CR>:qa<CR>', { desc = 'Write all and quit' })
vim.keymap.set('n', '<leader>n', ':new<CR>', { desc = 'New scratch buffer' })
vim.keymap.set('n', '<leader>cp', ':w !pbcopy<CR><CR>', { desc = 'Copy all buffer to clipboard' })
