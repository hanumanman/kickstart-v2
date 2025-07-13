return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        color = {
          suggestion_color = '#8B949E',
          cterm = 244,
        },
        keymaps = {
          clear_suggestion = '<C-]>',
          accept_suggestion = '<C-l>',
          accept_word = '<C-j>',
        },
      }
    end,
  },
}
