return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  keys = {
    {
      '-',
      '<cmd>Oil --float<cr>',
      mode = 'n',
      desc = 'Open Oil',
    },
  },
  ---@type oil.SetupOpts
  opts = {
    -- Configuration for the floating window in oil.open_float
    float = {
      -- Padding around the floating window
      padding = 7,
      max_width = 0,
      max_height = 0,
      border = 'rounded',
      win_options = {
        winblend = 0,
      },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
