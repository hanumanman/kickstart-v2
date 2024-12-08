return {
  'HiPhish/rainbow-delimiters.nvim',
  enabled = false,
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    -- Define the highlight from scratch if current theme is everforest or gruvbox material
    if vim.g.colors_name == 'everforest' or vim.g.colors_name == 'gruvbox-material' then
      local highlights = {
        RainbowDelimiterYellow = '#dbbc7f',
        RainbowDelimiterBlue = '#7fbbb3',
        RainbowDelimiterGreen = '#a7c080',
        RainbowDelimiterRed = '#e67e80',
        RainbowDelimiterCyan = '#83c092',
        RainbowDelimiterOrange = '#e69875',
      }
      for group, color in pairs(highlights) do
        vim.api.nvim_command('highlight ' .. group .. ' guifg=' .. color .. ' ctermfg=White')
      end
    end

    -- local highlights = {
    --   RainbowDelimiterYellow = '#DCA561',
    --   RainbowDelimiterBlue = '#658594',
    --   RainbowDelimiterGreen = '#76946A',
    --   RainbowDelimiterRed = '#E46876',
    --   RainbowDelimiterCyan = '#7AA89F',
    --   RainbowDelimiterOrange = '#FFA066',
    -- }
    -- for group, color in pairs(highlights) do
    --   vim.api.nvim_command('highlight ' .. group .. ' guifg=' .. color .. ' ctermfg=White')
    -- end

    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        -- 'RainbowDelimiterGreen',
        'RainbowDelimiterRed',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
