return {
  'f-person/git-blame.nvim',
  config = function()
    require('gitblame').setup {
      enabled = false,
      date_format = '%r',
    }
    require('lua-timeago').set_language(require 'lua-timeago/languages/en')
  end,
  keys = { { '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'Toggle Git Blame' } },
}
