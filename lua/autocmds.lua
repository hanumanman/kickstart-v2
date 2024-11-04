-- Highlight when yanking (copying) text
local textYankPostGroup = vim.api.nvim_create_augroup('yankTextGroup', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = textYankPostGroup,
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
  end,
})

-- Remember cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(opts)
    local ft = vim.bo[opts.buf].filetype
    local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
    if not (ft:match 'commit' and ft:match 'rebase') and last_known_line > 1 and last_known_line <= vim.api.nvim_buf_line_count(opts.buf) then
      vim.api.nvim_feedkeys([[g`"]], 'nx', false)
    end
  end,
})

-- Set approproate filetype for JSON and .env files (for syntax highlighting and commenting mostly)
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.json', '.env.*' },
  callback = function(event)
    if event.match:match '%.json$' then
      vim.bo.filetype = 'jsonc'
    elseif event.match:match '%.env%..*$' then
      vim.bo.filetype = 'sh'
    end
  end,
})

-- Set content.handlebars filetype to html for lsp support
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { 'content.handlebars' },
  callback = function()
    vim.bo.filetype = 'html'
  end,
})

-- Relative line number in normal mode and absolute in insert mode
local toggleNumberGroup = vim.api.nvim_create_augroup('numbertoggle', {})
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
  pattern = '*',
  group = toggleNumberGroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
      vim.opt.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
  pattern = '*',
  group = toggleNumberGroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd 'redraw'
    end
  end,
})
