return {
  'NvChad/nvim-colorizer.lua',
  enabled = false,
  event = 'BufEnter',
  opts = {
    user_default_options = {
      tailwind = true,
      -- Available modes for `mode`: foreground, background,  virtualtext
      mode = 'virtualtext',
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = true, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, --
    },
  },
}
