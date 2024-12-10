local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<cr>', 'o<Esc>')
map('n', '<leader><cr>', 'O<Esc>')
map('n', 'Y', 'y$')

map('n', '<C-i>', '<cmd>b#<cr>', { desc = 'Switch to the last buffer' })
map('i', '<C-v>', '<cmd>norm p<cr>', { desc = 'Paste' })

-- stylua: ignore
map('n', '<leader>e', function() vim.diagnostic.open_float() end, { desc = 'Show full diagnostic' })

-- Entire-textobject
map('n', 'yie', 'ggyG', { desc = 'Yank entire file' })
map('n', 'vie', 'ggVG', { desc = 'Select entire file' })
map('n', 'cie', 'ggcG', { desc = 'Change entire file' })
map('n', 'die', 'ggdG', { desc = 'Delete entire file' })

map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>l', 'yiwoconsole.log("Logging <C-r>0", <C-r>0)<Esc>', { desc = ' Turbo log' })
