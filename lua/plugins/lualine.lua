return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
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
  config = function()
    local function git_username()
      local handle = io.popen 'git config user.name'
      if not handle then
        return ''
      end
      local result = handle:read '*a'
      handle:close()
      if result == '' then
        return ''
      end
      return '󰊢 ' .. (result:gsub('^%s*(.-)%s*$', '%1')) -- Trim whitespace and add git icon
    end

    require('lualine').setup {
      options = {
        -- theme = 'vscode',
        theme = 'auto',
        disabled_filetypes = { 'alpha', 'trouble', 'Avante', 'AvanteInput' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = {
          { git_username },
          'branch',
          'diff',
          'diagnostics',
        },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = {
          'harpoon2',
        },
      },
    }
  end,
}
