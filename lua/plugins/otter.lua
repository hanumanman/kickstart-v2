return {
  'jmbuhr/otter.nvim',
  event = 'BufReadPost',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  keys = {
    {
      '<leader>to',
      function()
        require('otter').activate()
      end,
      desc = 'Release the LSPs!',
    },
  },
}
