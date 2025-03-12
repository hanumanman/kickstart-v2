return {
  {
    'vague2k/vague.nvim',
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        transparent = true, -- don't set background
      }

      vim.cmd 'colorscheme vague'

      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#727169', bg = nil, italic = false })
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
