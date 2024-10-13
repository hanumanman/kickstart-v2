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
      lualine_b = {
        function()
          local handle = io.popen 'git config user.name'
          if handle then
            local result = handle:read '*a'
            handle:close()
            return '󰊢 ' .. (result:gsub('^%s*(.-)%s*$', '%1')) -- Trim whitespace and add git icon
          else
            return '󰊢 Unknown User'
          end
        end,
        'branch',
        'diff',
        'diagnostics',
      },
      lualine_y = {
        'harpoon2',
      },
    },
  },
}
