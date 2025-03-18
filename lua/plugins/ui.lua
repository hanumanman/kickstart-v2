return {
  {
    'vague2k/vague.nvim',
    enabled = true,
    config = function()
      require('vague').setup {
        transparent = true, -- don't set background
      }

      vim.cmd 'colorscheme vague'
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#727169', bg = nil, italic = false })
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    enabled = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        options = {
          transparent = true, -- Disable setting the background color
          styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            functions = 'italic',
            keywords = 'bold',
            constants = 'bold',
          },
        },
      }

      vim.cmd 'colorscheme github_dark'
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#8B949E', bg = nil, italic = false })
      vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ffffff', bg = nil })
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
      user_default_options = {
        names = false,
        tailwind = true,
        mode = 'virtualtext',
      },
    },
  },
}
