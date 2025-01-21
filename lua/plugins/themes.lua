-- return {
--   'rose-pine/neovim',
--   enabled = true,
--   name = 'rose-pine',
--   config = function()
--     require('rose-pine').setup {
--       variant = 'moon',
--       styles = {
--         transparency = true,
--       },
--       highlight_groups = {
--         FloatBorder = { fg = 'foam' },
--       },
--     }
--     vim.cmd 'colorscheme rose-pine'
--   end,
-- }

return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      inverse = false,
      dim_inactive = false,
      transparent_mode = true,
    }
    vim.cmd 'colorscheme gruvbox'
  end,
}
