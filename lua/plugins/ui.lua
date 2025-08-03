local theme = {
  vague = false,
  rasmus = true,
}

local function set_highlights(highlights, definition)
  for _, group in ipairs(highlights) do
    vim.api.nvim_set_hl(0, group, definition)
  end
end

return {
  {
    'kvrohit/rasmus.nvim',
    enabled = theme.rasmus,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rasmus_transparent = true
      vim.cmd [[colorscheme rasmus]]

      set_highlights({
        '@lsp.type.method',
        '@lsp.type.function',
        '@lsp.typemod.function',
        '@function.member',
        '@function.call',
      }, { fg = '#eeeeee', italic = true })
      set_highlights({ '@lsp.type.variable' }, { fg = '#c0c0c0', bold = true })
      set_highlights({
        'BlinkCmpMenu',
        'StatusLine',
        'Pmenu',
        'Float',
        'NormalFloat',
        'FloatBorder',
        'LspReferenceText',
      }, { bg = 'none' })
      set_highlights({ 'String' }, { italic = true, fg = '#7BB099' })
      set_highlights(
        { 'LspSignatureActiveParameter' },
        { italic = true, fg = '#7BB099', underline = true, bold = true }
      )
      set_highlights({ 'SnacksPickerDir' }, { fg = '#8B949E' })
      set_highlights(
        { '@comment', '@lsp.type.comment' },
        { fg = '#E88D67', italic = true }
      )
      set_highlights({ '@markup.heading', '@constant.bash' }, { fg = '#eeeeee' })
      set_highlights({ 'WhichKeyGroup' }, { italic = false, fg = '#ffc591' })
    end,
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
      set_highlights({
        '@lsp.type.method',
        '@lsp.type.function',
        '@lsp.typemod.function',
        '@function.member',
        '@function.call',
      }, { fg = '#c48282', italic = true })
    end,
  },
}
