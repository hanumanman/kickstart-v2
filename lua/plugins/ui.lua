local theme = {
  kanagawa = false,
  vague = true,
  ashen = false,
}

local function set_highlights(highlights, definition)
  for _, group in ipairs(highlights) do
    vim.api.nvim_set_hl(0, group, definition)
  end
end

return {
  {
    'ficcdaf/ashen.nvim',
    tag = '*',
    lazy = false,
    enabled = theme.ashen,
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme ashen]]
    end,
    opts = {
      transparent = true,
    },
  },
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
      set_highlights(
        { 'DiagnosticUnnecessary', 'OilFileHidden', 'OilDirHidden' },
        { fg = '#727169' }
      )
      set_highlights({ 'Visual', 'CurSearch' }, { bg = '#3a3d37' })
      set_highlights({ 'LspSignatureActiveParameter' }, { link = '@character' })
      set_highlights(
        { '@comment', '@lsp.type.comment' },
        { italic = true, fg = '#7db574' }
      )
      set_highlights({ 'BlinkCmpMenu', 'StatusLine', 'Pmenu' }, { bg = 'none' })
      set_highlights({ 'BufferLineBackground' }, { fg = '#8B949E' })
      set_highlights({ 'FlashBackdrop' }, { link = 'BufferLineBackground' })
      set_highlights({ 'FlashLabel' }, { fg = '#E8B589', bg = 'none' })
      set_highlights({ '@lsp.type.variable' }, { bold = true })
      set_highlights({ '@type.builtin' }, { bold = false })
      set_highlights({ '@punctuation.bracket', '@constructor.lua' }, { italic = false })
      set_highlights(
        {
          '@lsp.type.method',
          '@lsp.type.function',
          '@lsp.typemod.function',
          '@function.member',
          '@function.call',
        },
        { fg = '#c48282', italic = true }
      )
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
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local kanagawaTheme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(kanagawaTheme.ui.bg, 0.95):to_hex() }
          end
          return {
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
          }
        end,
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }

      vim.cmd [[colorscheme kanagawa]]

      set_highlights(
        { 'FloatBorder', 'BlinkCmpMenuBorder', 'NormalFloat', 'FloatTitle' },
        { bg = 'none' }
      )
      set_highlights({ 'SnacksPickerBorder' }, { fg = '#727169', bg = 'none' })
      set_highlights({ 'SnacksPickerDir', 'BufferLineBackground' }, { fg = '#8B949E' })
      set_highlights(
        { 'OilDirHidden', 'OilFileHidden', 'DiagnosticUnnecessary' },
        { fg = '#727169' }
      )
      set_highlights({ 'LspSignatureActiveParameter' }, { italic = true })
      set_highlights({ '@lsp.type.variable' }, { bold = true })
      set_highlights({ '@lsp.type.comment' }, { fg = '#76946A' })
      set_highlights({ '@type.builtin' }, { bold = false })
    end,
  },
}
