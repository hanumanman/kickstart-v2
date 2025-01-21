return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.indentscope').setup()
    require('mini.cursorword').setup()
  end,
  -- 'echasnovski/mini.ai',
  -- version = '*',
}
