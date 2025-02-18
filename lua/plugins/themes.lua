-- return {
--   'sainnhe/gruvbox-material',
--   lazy = false,
--   priority = 1000,
--   init = function()
--     vim.g.gruvbox_material_enable_italic = true
--     vim.g.gruvbox_material_transparent_background = 2
--     vim.g.gruvbox_material_ui_contrast = 'high'
--     vim.g.gruvbox_material_float_style = 'dim'
--     vim.g.gruvbox_material_current_word = 'underline'
--     vim.cmd.colorscheme 'gruvbox-material'
--   end,
-- }
--
--
return {
  'ellisonleao/gruvbox.nvim',
  enabled = false,
  lazy = false,
  priority = 1000,
  init = function()
    vim.o.background = 'dark' -- or "light" for light mode
    vim.cmd [[colorscheme gruvbox]]
  end,
  opts = {
    inverse = false, -- invert background for search, diffs, statuslines and errors
    transparent_mode = true,
  },
}
