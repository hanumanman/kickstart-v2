-- Highlight when yanking (copying) text
local textYankPostGroup = vim.api.nvim_create_augroup('yankTextGroup', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = textYankPostGroup,
  callback = function()
    vim.highlight.on_yank { timeout = 100 }
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

-- Relative line number in normal mode and absolute in insert mode
local toggleNumberGroup = vim.api.nvim_create_augroup('numbertoggle', {})
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' },
  {
    pattern = '*',
    group = toggleNumberGroup,
    callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= 'i' then
        vim.opt.relativenumber = true
      end
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' },
  {
    pattern = '*',
    group = toggleNumberGroup,
    callback = function()
      if vim.o.nu then
        vim.opt.relativenumber = false
        vim.cmd 'redraw'
      end
    end,
  }
)

-- LSP progress notification
vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner =
      { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
      id = 'lsp_progress',
      title = 'LSP Progress',
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == 'end' and ' '
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
