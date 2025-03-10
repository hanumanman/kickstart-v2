return {
  'folke/snacks.nvim',
  event = 'VimEnter',
  opts = {},
  keys = {
    -- Top Pickers & Explorer
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
      '<leader>dg',
      function()
        Snacks.picker.git_files { layout = 'ivy' }
      end,
      desc = 'Find Git Files',
    },
    {
      '<leader>do',
      function()
        Snacks.picker.recent { layout = 'ivy' }
      end,
      desc = 'Recent',
    },
    -- git
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
  },
}
