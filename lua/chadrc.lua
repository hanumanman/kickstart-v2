local options = {

  base46 = {
    theme = 'kanagawa', -- default theme
    transparency = true,
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = '󱓻',
      },
    },

    telescope = { style = 'bordered' }, -- borderless / bordered

    statusline = {
      theme = 'minimal',
      separator_style = 'default',
      order = { 'mode', 'file', 'git', 'git_username', '%=', 'lsp_msg', '%=', 'diagnostics', 'lsp', 'cwd', 'cursor' },
      modules = {
        git_username = function()
          local handle = io.popen 'git config user.name'
          if not handle then
            return ''
          end
          local result = handle:read '*a'
          handle:close()
          if result == '' then
            return ''
          end
          return ' 󰊢 ' .. (result:gsub('^%s*(.-)%s*$', '%1')) -- Trim whitespace and add git icon
        end,
      },
    },

    tabufline = {
      enabled = false,
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ['bo sp'] = 0.3, ['bo vsp'] = 0.2 },
    float = {
      relative = 'editor',
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = 'single',
    },
  },

  lsp = { signature = false },

  cheatsheet = {
    theme = 'grid', -- simple/grid
    excluded_groups = { 'terminal (t)', 'autopairs', 'Nvim', 'Opens' }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = true,
    mode = 'virtual', -- fg, bg, virtual
    virt_text = '󱓻 ',
    highlight = { hex = true, lspvars = true },
  },
}

return options
