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
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_ui_contrast = 'high'
    vim.g.gruvbox_material_float_style = 'dim'
    vim.g.gruvbox_material_current_word = 'underline'
    vim.cmd.colorscheme 'gruvbox-material'
  end,
  opts = {},
}
