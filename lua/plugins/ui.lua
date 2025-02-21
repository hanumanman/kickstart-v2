return {
  'nvim-lua/plenary.nvim',
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  {
    'nvchad/ui',
    config = function()
      require 'nvchad'
    end,
  },

  {
    'nvchad/base46',
    lazy = true,
    enabled = true,
    build = function()
      require('base46').load_all_highlights()
    end,
  },

  'nvchad/volt', -- optional, needed for theme switcher
  -- or just use Telescope themes
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    init = function()
      vim.o.background = 'dark' -- or "light" for light mode
      vim.cmd [[colorscheme gruvbox]]
    end,
    opts = {
      inverse = false, -- invert background for search, diffs, statuslines and errors
      transparent_mode = true,
    },
  },
}
