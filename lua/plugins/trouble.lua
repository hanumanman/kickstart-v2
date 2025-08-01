---@diagnostic disable: missing-fields, missing-parameter
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>q',

      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Toggle diagnostics',
    },
  },
  opts = {
    auto_close = true,
    focus = true,
    keys = {
      ['<cr>'] = 'jump_close',
      ['o'] = 'jump',
      ['n'] = 'next',
      ['b'] = 'prev',
    },
  },
}
