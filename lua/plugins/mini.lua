return {
  -- { 'echasnovski/mini.ai', version = false, opts = {
  --   n_lines = 500,
  -- } },
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    -- require('mini.indentscope').setup()
    require('mini.cursorword').setup()
  end,
}
