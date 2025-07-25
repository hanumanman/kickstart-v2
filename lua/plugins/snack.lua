return {
  'folke/snacks.nvim',
  event = 'VimEnter',
  lazy = false,
  priority = 1000,
  init = function()
    -- Setup LSP progress notifications
    vim.api.nvim_create_autocmd('LspProgress', {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
          id = 'lsp_progress',
          title = 'LSP Progress',
          opts = function(notif)
            notif.icon = ev.data.params.value.kind == 'end' and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = {
      indent = {
        enabled = false,
        only_scope = true, -- only show indent guides of the scope
        only_current = true,
      },
    },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    -- Pickers & Explorer
    {
      '<leader>s',
      function()
        Snacks.picker.smart { layout = 'ivy' }
      end,
      desc = 'Find Files',
    },
    {
      '<leader>df',
      function()
        Snacks.picker.files { finder = 'files', format = 'file', layout = 'ivy', hidden = true, ignored = true }
      end,
      desc = 'Find All Files',
    },
    {
      '<leader>dd',
      function()
        Snacks.picker.resume { layout = 'ivy' }
      end,
      desc = 'Resume Last Picker',
    },

    {
      '<leader>dl',
      function()
        Snacks.picker.highlights { layout = 'ivy' }
      end,
      desc = 'Buffers',
    },
    {
      '<leader>db',
      function()
        Snacks.picker.buffers { layout = 'ivy' }
      end,
      desc = 'Buffers',
    },
    {
      '<leader>dw',
      function()
        Snacks.picker.grep { layout = 'ivy' }
      end,
      desc = 'Grep',
    },
    {
      ',',
      function()
        Snacks.explorer {
          auto_close = true,
          include = { '.env' },
          ignored = false,
        }
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>da',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Grep Line',
    },
    {
      '<leader>dg',
      function()
        Snacks.picker.git_files { layout = 'ivy' }
      end,
      desc = 'Find Git Files',
    },
    {
      '<leader>do',
      function()
        Snacks.picker.recent { layout = 'ivy', filter = { cwd = true } }
      end,
      desc = 'Recent',
    },
    {
      '<leader>dB',
      function()
        Snacks.picker.grep_buffers { layout = 'ivy' }
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>dW',
      function()
        Snacks.picker.grep_word { layout = 'ivy' }
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>ds',
      function()
        Snacks.picker.lsp_symbols { layout = 'ivy' }
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>dl',
      function()
        Snacks.picker.diagnostics { layout = 'ivy' }
      end,
    },
    {
      '<leader>g',
      function()
        Snacks.lazygit()
      end,
      desc = 'LazyGit',
    },
  },
}
