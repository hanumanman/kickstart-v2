local function set_highlights(highlights, definition)
  for _, group in ipairs(highlights) do
    vim.api.nvim_set_hl(0, group, definition)
  end
end

return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd 'colorscheme terafox'
    set_highlights({ '@lsp.type.variable' }, { bold = true })
    set_highlights({ 'SnacksPickerDir' }, { fg = '#8B949E' })
    set_highlights({
      'BlinkCmpMenu',
      'StatusLine',
      'Pmenu',
      'Float',
      'NormalFloat',
      'FloatBorder',
      'LspReferenceText',
      'BlinkCmpDoc',
      'BlinkCmpDocBorder',
    }, { bg = 'none' })
    set_highlights(
      { 'LspSignatureActiveParameter' },
      { italic = true, fg = '#ff8349', underline = true, bold = true }
    )
    set_highlights({
      '@lsp.type.method',
      '@lsp.type.function',
      '@lsp.typemod.function',
      '@function.member',
      '@function.call',
    }, { italic = true })
    set_highlights({ '@comment', '@lsp.type.comment' }, { italic = true, fg = '#6D7F8B' })
  end,
  opts = {
    options = {
      -- transparent = false,
    },
  },
}
