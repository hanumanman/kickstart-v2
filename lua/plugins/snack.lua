return {
  'folke/snacks.nvim',
  event = 'VimEnter',
  lazy = false,
  priority = 1000,
  init = function()
    local function setup_lsp_indicator()
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
    end

    setup_lsp_indicator()
  end,
  opts = {
    bigfile = { enabled = true },
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
    quickfile = { enabled = false },

    scope = { enabled = true },
    statuscolumn = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    -- Pickers & Explorer
    {
      '<leader>s',
      function()
        Snacks.picker.smart { filter = { cwd = true } }
      end,
      desc = 'Find Files',
    },
    {
      '<leader>df',
      function()
        Snacks.picker.files {
          finder = 'files',
          format = 'file',
          hidden = true,
          ignored = true,
        }
      end,
      desc = 'Find All Files (including hidden and ignored)',
    },
    {
      '<leader>dd',
      function()
        Snacks.picker.resume {}
      end,
      desc = 'Resume Last Picker',
    },
    {
      '<leader>dg',
      function()
        Snacks.picker.git_branches {}
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>dl',
      function()
        Snacks.picker.highlights {}
      end,
      desc = 'Highlights',
    },
    {
      '<leader>db',
      function()
        Snacks.picker.buffers {}
      end,
      desc = 'Buffers',
    },
    {
      '<leader>dw',
      function()
        Snacks.picker.grep {}
      end,
      desc = 'Grep',
    },
    {
      '<leader>da',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Grep Line',
    },
    {
      '<leader>do',
      function()
        Snacks.picker.recent { filter = { cwd = true } }
      end,
      desc = 'Recent',
    },
    {
      '<leader>dB',
      function()
        Snacks.picker.grep_buffers {}
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>dt',
      function()
        Snacks.picker.todo_comments {
          keywords = { 'TODO', 'FIX', 'FIXME' },
        }
      end,
      desc = 'Search TODO comments',
    },
    {
      '<leader>dW',
      function()
        Snacks.picker.grep_word {}
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      '<leader>ds',
      function()
        Snacks.picker.lsp_symbols {
          filter = {
            default = true,
          },
        }
      end,
      desc = 'LSP Symbols',
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
