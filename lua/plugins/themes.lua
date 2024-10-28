return {
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
    opts = {
      transparent = true,
      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          -- Comment = { fg = '#9CA1AA' },
        }
      end,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
  },
  {
    'rose-pine/neovim',
    enabled = false,
    name = 'rose-pine',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
    opts = {
      styles = {
        bold = false,
        italic = false,
        transparency = true,
      },
    },
  },
  {
    'catppuccin/nvim',
    enabled = false,
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
    opts = {
      transparent_background = true,
      integrations = {
        cmp = true,
        treesitter = true,
        mini = {
          enabled = true,
        },
      },
    },
  },
  {
    'Mofiqul/vscode.nvim',
    enabled = false,
    name = 'vscode',
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = 'dark'
      require('vscode').load 'dark'
      vim.cmd.colorscheme = 'vscode'
    end,
    config = function()
      require('vscode').setup {
        transparent = true,
        italic_comments = true,
        underline_links = true,
      }
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require('nordic').setup {
        transparent = {
          bg = true,
          float = true,
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = 'classic',
        },
        on_highlight = function(highlights, _)
          highlights.Visual = { bg = '#2E3440', bold = true }
          highlights.CursorLine = { bg = '#3B4252', bold = true }
        end,
        -- override = {
        --   CursorLine = {
        --     bg = '#000000',
        --     bold = true,
        --   },
        --   Visual = {
        --     bg = '#000000',
        --     bold = true,
        --   },
        -- },
      }
      require('nordic').load()
    end,
  },
}
