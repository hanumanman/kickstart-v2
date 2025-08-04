return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    icons = {
      mappings = false,
    },

    -- Document existing key chains
    spec = {
      { '<leader>a', group = 'AI' },
      { '<leader>d', group = 'Telescope' },
      { '<leader>b', group = 'Buffers' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>i', group = 'Imports management (JS/TS)', mode = { 'n', 'v' } },
    },
  },
}
