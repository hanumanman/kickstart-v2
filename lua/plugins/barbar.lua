return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require('barbar').setup {
        auto_hide = 1,
        icons = {
          button = '',
          separator = { left = ' ', right = ' ' },
          separator_at_end = false,
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = '󱚝 ' },
            [vim.diagnostic.severity.WARN] = { enabled = true },
          },
        },
      }

      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
      map('n', 'L', '<Cmd>BufferNext<CR>', opts)

      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

      -- Close buffer
      map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
      map('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
      map('n', '<leader>br', '<Cmd>BufferCloseBuffersRight<CR>', opts)
      map('n', '<leader>bl', '<Cmd>BufferCloseBuffersLeft<CR>', opts)

      -- Magic buffer-picking mode
      map('n', '<S-Tab>', '<Cmd>BufferPick<CR>', opts)
    end,
  },
}
