return {
  -- {
  --   'vague2k/vague.nvim',
  --   config = function()
  --     -- NOTE: you do not need to call setup if you don't want to.
  --     require('vague').setup {
  --       transparent = true, -- don't set background
  --     }
  --
  --     vim.cmd 'colorscheme vague'
  --
  --     vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#727169', bg = nil, italic = false })
  --   end,
  -- },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = true,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false, -- invert background for search, diffs, statuslines and errors
        contrast = '', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }

      vim.o.background = 'dark' -- or "light" for light mode
      vim.cmd [[colorscheme gruvbox]]
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#83A598', bg = nil, italic = false })
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
