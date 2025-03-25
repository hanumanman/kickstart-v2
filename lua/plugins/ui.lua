local setHighlight = vim.api.nvim_set_hl

local theme = {
  github = true,
  vague = false,
}

return {
  {
    'vague2k/vague.nvim',
    enabled = theme.vague,
    config = function()
      require('vague').setup {
        transparent = true, -- don't set background
      }

      vim.cmd 'colorscheme vague'
      setHighlight(0, 'SnacksPickerDir', { fg = '#727169', bg = nil, italic = false })
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    enabled = theme.github,
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {
        options = {
          transparent = true, -- Disable setting the background color
          styles = {
            comments = 'italic',
            functions = 'italic',
          },
        },
      }

      vim.cmd 'colorscheme github_dark'
      setHighlight(0, 'SnacksPickerDir', { fg = '#8B949E', bg = nil, italic = false })
      setHighlight(0, 'FloatBorder', { fg = '#ffffff', bg = nil })
      setHighlight(0, 'BufferLineTabSelected', { fg = '#ffffff', bg = nil })
      setHighlight(0, 'BufferLineHintSelected', { fg = '#ffffff', bg = nil, italic = true })
      setHighlight(0, 'BufferLineHintDiagnosticSelected', { fg = '#ffffff', bg = nil })
      setHighlight(0, 'DiagnosticHint', { fg = '#ffffff', bg = nil })
      setHighlight(0, '@tag', { fg = '#FFFFFF', bg = nil })
    end,
  },
}
