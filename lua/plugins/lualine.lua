return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = 'vscode',
    sections = {
      lualine_c = { { 'filename', path = 1 } },
    },
  },
}