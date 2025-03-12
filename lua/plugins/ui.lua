return {
  {
    'shaunsingh/nord.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      -- vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      -- Load the colorscheme
      require('nord').set()
      -- Change the value of highligh group SnackPickerDir
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#81a1c1', bg = nil, bold = true })
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true, italic = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            -- Darker completion menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
        theme = 'wave', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }

      -- setup must be called before loading
      vim.cmd 'colorscheme kanagawa'
      vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#727169', bg = nil, italic = false })
      -- vim.api.nvim_set_hl(0, 'SnacksPickerDir', '@comment')
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
      user_default_options = {
        names = false,
        tailwind = true,
        mode = 'virtualtext',
      },
    },
  },
}
