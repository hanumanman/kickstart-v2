return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'helix',
    icons = {
      mappings = false,
    },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = 'Code', mode = { 'n', 'x' } },
      { '<leader>r', group = 'Rename' },
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
