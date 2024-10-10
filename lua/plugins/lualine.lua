return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'letieu/harpoon-lualine',
      dependencies = {
        {
          'ThePrimeagen/harpoon',
          branch = 'harpoon2',
        },
      },
    },
  },
  opts = {
    theme = 'vscode',
    sections = {
      lualine_c = { { 'filename', path = 1 } },
      lualine_y = { 'progress', 'harpoon2' },
    },
  },
}
