return {
  --TODO Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true, highlight = { multiline = false, after = '', pattern = [[.*<(KEYWORDS):]] } },
  },
}
