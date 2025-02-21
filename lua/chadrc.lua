local options = {

  base46 = {
    theme = 'kanagawa', -- default theme
    transparency = true,
  },

  ui = {
    cmp = {
      icons_left = true, -- only for non-atom styles!
      format_colors = {
        tailwind = true, -- will work for css lsp too
        icon = '󱓻',
      },
    },

    telescope = { style = 'bordered' }, -- borderless / bordered

    statusline = {
      enabled = true,
      theme = 'default',
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
          return '  ' .. (result:gsub('^%s*(.-)%s*$', '%1')) -- Trim whitespace and add git icon
        end,
      },
    },

    tabufline = {
      enabled = false,
    },
  },

  lsp = { signature = false },

  colorify = {
    enabled = true,
    mode = 'virtual', -- fg, bg, virtual
    virt_text = '󱓻 ',
    highlight = { hex = true, lspvars = true },
  },
}

return options
