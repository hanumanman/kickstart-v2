local map = vim.keymap.set

map('n', '<leader>f', function()
  vim.cmd 'w'
end, { desc = 'Save and format' })

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

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })
map('n', '<cr>', 'o<Esc>', { desc = 'Insert newline below in normal mode' })
map('n', '<leader><cr>', 'O<Esc>', { desc = 'Insert newline above in normal mode' })
map('n', 'Y', 'y$', { desc = 'Yank to end of line' })
map('i', '<C-v>', '<cmd>norm p<cr>', { desc = 'Paste in insert mode' })
map(
  'n',
  '<leader>l',
  'yiwo// TODO: Delete console.log<Esc>oconsole.log("LOGGING <C-r>0", <C-r>0)<Esc>0wxxx',
  { desc = 'console.log' }
)

--Buffer navigation
map('n', '<C-i>', '<cmd>b#<cr>', { desc = 'Switch to the last buffer' })
map('n', '<leader>x', '<cmd>bdelete<cr>', { desc = 'Close current buffer' })
map('n', 'H', '<cmd>bprev<cr>', { desc = 'Switch to the left buffer' })
map('n', 'L', '<cmd>bnext<cr>', { desc = 'Switch to the right buffer' })

-- stylua: ignore start
map('n', '<A-j>', function() vim.api.nvim_command 'move .+1' end, { desc = 'Move line down' })
map('n', '<A-k>', function() vim.api.nvim_command 'move .-2' end, { desc = 'Move line up' })
-- stylua: ignore end
