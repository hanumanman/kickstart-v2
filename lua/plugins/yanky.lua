return {
  'gbprod/yanky.nvim',
  keys = {
    {
      '<c-p>',
      mode = { 'n' },
      '<Plug>(YankyPreviousEntry)',
      desc = 'YankyPreviousEntry',
    },
    {
      '<c-n>',
      mode = { 'n' },
      '<Plug>(YankyNextEntry)',
      desc = 'YankyNextEntry',
    },
    {
      'p',
      mode = { 'n', 'v' },
      '<Plug>(YankyPutAfter)',
      desc = 'Paste after',
    },
    {
      'P',
      mode = { 'n', 'v' },
      '<Plug>(YankyPutBefore)',
      desc = 'Paste before',
    },
  },
  opts = {
    highlight = {
      on_yank = false,
      on_put = false,
    },
  },
}
