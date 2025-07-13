local theme = {
  kanagawa = true,
  vague = true,
}

return {
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    enabled = theme.vague,
    config = function()
      require('vague').setup {
        bold = true,
        transparent = true,
        style = {
          functions = 'italic',
          boolean = 'none',
        },
      }
      vim.cmd 'colorscheme vague'

      -- Tweak colors
      vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#727169' })
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#3a3d37' })
      vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { link = '@character' })
      vim.api.nvim_set_hl(0, 'Comment', { fg = '#7db574' })
      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'BufferLineBackground', { fg = '#8B949E' })
      vim.api.nvim_set_hl(0, 'FlashBackdrop', { link = 'BufferLineBackground' })
      vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#E8B589', bg = 'none' })
      vim.api.nvim_set_hl(0, '@lsp.type.comment', { fg = '#7db574' })
      vim.api.nvim_set_hl(0, '@lsp.type.variable', { bold = true })
      vim.api.nvim_set_hl(0, '@type.builtin', { bold = false })
      vim.api.nvim_set_hl(0, '@lsp.type.method', { fg = '#c48282', italic = true })
      vim.api.nvim_set_hl(0, '@lsp.type.function', { fg = '#c48282', italic = true })
      vim.api.nvim_set_hl(0, '@lsp.typemod.function', { fg = '#c48282', italic = true })
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    enabled = theme.kanagawa,
    config = function()
      require('kanagawa').setup {
        compile = true, -- enable compiling the colorscheme (make sure to set up the compiler) (Should run :KanagawaCompile after changing config to take effect)
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        typeStyle = { bold = false },
        functionStyle = { italic = true },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { bold = false },
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {
            ui = {
              bg_gutter = 'none',
            },
          } },
        },
        overrides = function(colors)
          local kanagawaTheme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(kanagawaTheme.ui.bg, 0.95):to_hex() }
          end
          return {
            LspSignatureActiveParameter = { italic = true },
            DiagnosticUnnecessary = { fg = '#727169' },
            Comment = { fg = '#76946A' },
            NormalFloat = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            NormalDark = { fg = kanagawaTheme.ui.fg_dim, bg = kanagawaTheme.ui.bg_m3 },
            LazyNormal = { bg = kanagawaTheme.ui.bg_m3, fg = kanagawaTheme.ui.fg_dim },
            MasonNormal = { bg = kanagawaTheme.ui.bg_m3, fg = kanagawaTheme.ui.fg_dim },
            Pmenu = { fg = kanagawaTheme.ui.shade0, bg = 'none', blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
            FlashBackdrop = { fg = kanagawaTheme.diag.hint },
            PmenuExtra = { fg = kanagawaTheme.ui.shade0, bg = 'none' },
            DiagnosticVirtualTextHint = makeDiagnosticColor(kanagawaTheme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(kanagawaTheme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(kanagawaTheme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(kanagawaTheme.diag.error),
            SnacksPickerBorder = { fg = '#727169', bg = 'none' },
            SnacksPickerDir = { fg = '#8B949E', bg = nil, italic = false },
            FloatBorder = { bg = 'none' },
            BlinkCmpMenuBorder = { bg = 'none' },
            BufferLineBackground = { fg = '#8B949E' },
            ['@lsp.type.variable'] = { bold = true },
            ['@type.builtin'] = { bold = false },
          }
        end,
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }

      vim.cmd [[colorscheme kanagawa]]
    end,
  },
}
