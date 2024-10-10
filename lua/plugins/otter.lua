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
--- Activate the current buffer by adding and synchronizing
        require('otter').activate()
      end,
      desc = 'Release the LSPs!',
    },
  },
}
