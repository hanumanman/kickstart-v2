return {
  {
    'rebelot/kanagawa.nvim',
    enabled = true,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('kanagawa').setup {
        transparent = true,
        disable_nvimtree_bg = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
          end

          return {
            DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
      }

      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'rose-pine/neovim',
    enabled = false,
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'main',
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
        highlight_groups = {
          CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
          Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
        },
      }
      vim.cmd 'colorscheme rose-pine'
    end,
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
        italic_comments = false,
        underline_links = true,
        disable_nvimtree_bg = true,
      }
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    enabled = false,
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
      }
      require('nordic').load()
    end,
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_visual = 'blue background'
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_current_word = 'underline'
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
  {
    'sainnhe/everforest',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.everforest_enable_italic = false
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_current_word = 'underline'
      vim.g.everforest_better_performance = 1
      vim.cmd.colorscheme 'everforest'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
    opts = {
      transparent = true,
    },
  },
}
