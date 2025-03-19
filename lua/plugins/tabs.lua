return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    enabled = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          mode = 'buffers', -- set to "tabs" to only show tabpages instead
          themable = false,
          indicator = {
            style = 'none',
            -- icon = '󰄛',
          },
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = { '', '' },
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icons = { error = '󱚡 ', warning = ' ' } -- Only show errors and warnings
            local icon = icons[level] or ''
            return icon ~= '' and ' ' .. icon .. count or ''
          end,
        },
      }

      -- Mappings
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Close buffer(s)
      map('n', '<leader>bc', '<Cmd>BufferLineCloseOthers<CR>', opts)
      map('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', opts)
      map('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', opts)

      -- Magic buffer-picking mode
      map('n', '<S-Tab>', '<Cmd>BufferLinePick<CR>', opts)
    end,
  },
}
