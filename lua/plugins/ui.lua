local theme = {
  kanagawa = false,
  github = false,
  catppuccin = false,
  vague = true,
}

return {
  {
    'vague2k/vague.nvim',
    lazy = false,
    priority = 1000,
    enabled = theme.vague,
    config = function()
      require('vague').setup {
        transparent = true,
        style = {
          functions = 'italic',
        },
        -- Override colors
        -- colors = {
        --   floatBorder = '#ffffff',
        -- },
      }
      vim.cmd 'colorscheme vague'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = theme.kanagawa,
    config = function()
      -- Default options:
      require('kanagawa').setup {
        compile = true, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        typeStyle = { bold = false },
        functionStyle = { italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {
            ui = {
              bg_gutter = 'none',
            },
          } },
        },
        overrides = function(colors)
          local kanagawaTheme = colors.theme
          local makeDiagnosticColor = function(color)
            local c = require 'kanagawa.lib.color'
            return { fg = color, bg = c(color):blend(kanagawaTheme.ui.bg, 0.95):to_hex() }
          end
          return {
            NormalFloat = { bg = 'none' },
            FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = kanagawaTheme.ui.fg_dim, bg = kanagawaTheme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = kanagawaTheme.ui.bg_m3, fg = kanagawaTheme.ui.fg_dim },
            MasonNormal = { bg = kanagawaTheme.ui.bg_m3, fg = kanagawaTheme.ui.fg_dim },
            Pmenu = { fg = kanagawaTheme.ui.shade0, bg = kanagawaTheme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = 'NONE', bg = kanagawaTheme.ui.bg_p2 },
            PmenuSbar = { bg = kanagawaTheme.ui.bg_m1 },
            PmenuThumb = { bg = kanagawaTheme.ui.bg_p2 },
            DiagnosticVirtualTextHint = makeDiagnosticColor(kanagawaTheme.diag.hint),
            DiagnosticVirtualTextInfo = makeDiagnosticColor(kanagawaTheme.diag.info),
            DiagnosticVirtualTextWarn = makeDiagnosticColor(kanagawaTheme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(kanagawaTheme.diag.error),
            SnacksPickerBorder = { fg = '#727169', bg = 'none' },
            SnacksPickerDir = { fg = '#8B949E', bg = nil, italic = false },
            FloatBorder = { bg = 'none' },
            BufferLineSelected = { fg = '#ffffff', bg = kanagawaTheme.ui.bg_p2 },
          }
        end,
        theme = 'wave', -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
          light = 'lotus',
        },
      }

      -- setup must be called before loading
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin',
    enabled = theme.catppuccin,
    init = function()
      vim.cmd [[colorscheme catppuccin]]
    end,
    opts = {
      background = {
        dark = 'mocha',
      },
      transparent_background = true,
      show_end_of_buffer = false,
      integrations = {
        window_picker = true,
        diffview = true,
      },
      color_overrides = {
        mocha = {
          rosewater = '#ea6962',
          flamingo = '#ea6962',
          red = '#ea6962',
          maroon = '#ea6962',
          pink = '#d3869b',
          mauve = '#d3869b',
          peach = '#e78a4e',
          yellow = '#d8a657',
          green = '#a9b665',
          teal = '#89b482',
          sky = '#89b482',
          sapphire = '#89b482',
          blue = '#7daea3',
          lavender = '#7daea3',
          text = '#ebdbb2',
          subtext1 = '#d5c4a1',
          subtext0 = '#bdae93',
          overlay2 = '#a89984',
          overlay1 = '#928374',
          overlay0 = '#595959',
          surface2 = '#4d4d4d',
          surface1 = '#404040',
          surface0 = '#292929',
          base = '#1d2021',
          mantle = '#191b1c',
          crust = '#141617',
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            SnacksPickerDir = { fg = colors.overlay1 },
            CmpItemMenu = { fg = colors.surface2 },
            CursorLineNr = { fg = colors.text },
            FloatBorder = { bg = colors.base, fg = colors.text },
            GitSignsChange = { fg = colors.peach },
            LineNr = { fg = colors.overlay0 },
            LspInfoBorder = { link = 'FloatBorder' },
            NeoTreeDirectoryIcon = { fg = colors.subtext1 },
            NeoTreeDirectoryName = { fg = colors.subtext1 },
            NeoTreeFloatBorder = { link = 'TelescopeResultsBorder' },
            NeoTreeGitConflict = { fg = colors.red },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeGitIgnored = { fg = colors.overlay0 },
            NeoTreeGitModified = { fg = colors.peach },
            NeoTreeGitStaged = { fg = colors.green },
            NeoTreeGitUnstaged = { fg = colors.red },
            NeoTreeGitUntracked = { fg = colors.green },
            NeoTreeIndent = { fg = colors.surface1 },
            NeoTreeNormal = { bg = colors.mantle },
            NeoTreeNormalNC = { bg = colors.mantle },
            NeoTreeRootName = { fg = colors.subtext1, style = { 'bold' } },
            NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
            NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
            NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
            NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
            NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
            NormalFloat = { bg = colors.base },
            Pmenu = { bg = colors.mantle, fg = '' },
            PmenuSel = { bg = colors.surface0, fg = '' },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { 'bold' } },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopeSelection = { bg = colors.surface0 },
            VertSplit = { bg = colors.base, fg = colors.surface0 },
            WhichKeyFloat = { bg = colors.mantle },
            YankHighlight = { bg = colors.surface2 },
            FidgetTask = { fg = colors.subtext2 },
            FidgetTitle = { fg = colors.peach },

            IblIndent = { fg = colors.surface0 },
            IblScope = { fg = colors.overlay0 },

            Boolean = { fg = colors.mauve },
            Number = { fg = colors.mauve },
            Float = { fg = colors.mauve },

            PreProc = { fg = colors.mauve },
            PreCondit = { fg = colors.mauve },
            Include = { fg = colors.mauve },
            Define = { fg = colors.mauve },
            Conditional = { fg = colors.red },
            Repeat = { fg = colors.red },
            Keyword = { fg = colors.red },
            Typedef = { fg = colors.red },
            Exception = { fg = colors.red },
            Statement = { fg = colors.red },

            Error = { fg = colors.red },
            StorageClass = { fg = colors.peach },
            Tag = { fg = colors.peach },
            Label = { fg = colors.peach },
            Structure = { fg = colors.peach },
            Operator = { fg = colors.peach },
            Title = { fg = colors.peach },
            Special = { fg = colors.yellow },
            SpecialChar = { fg = colors.yellow },
            Type = { fg = colors.yellow, style = { 'bold' } },
            Function = { fg = colors.green, style = { 'bold', 'italic' } },
            Delimiter = { fg = colors.subtext2 },
            Ignore = { fg = colors.subtext2 },
            Macro = { fg = colors.teal },

            TSAnnotation = { fg = colors.mauve },
            TSAttribute = { fg = colors.mauve },
            TSBoolean = { fg = colors.mauve },
            TSCharacter = { fg = colors.teal },
            TSCharacterSpecial = { link = 'SpecialChar' },
            TSComment = { link = 'Comment' },
            TSConditional = { fg = colors.red },
            TSConstBuiltin = { fg = colors.mauve },
            TSConstMacro = { fg = colors.mauve },
            TSConstant = { fg = colors.text },
            TSConstructor = { fg = colors.green },
            TSDebug = { link = 'Debug' },
            TSDefine = { link = 'Define' },
            TSEnvironment = { link = 'Macro' },
            TSEnvironmentName = { link = 'Type' },
            TSError = { link = 'Error' },
            TSException = { fg = colors.red },
            TSField = { fg = colors.blue },
            TSFloat = { fg = colors.mauve },
            TSFuncBuiltin = { fg = colors.green },
            TSFuncMacro = { fg = colors.green },
            TSFunction = { fg = colors.green, style = { 'italic' } },
            TSFunctionCall = { fg = colors.green, style = { 'italic' } },
            TSInclude = { fg = colors.red },
            TSKeyword = { fg = colors.red },
            TSKeywordFunction = { fg = colors.red, style = { 'italic' } },
            TSKeywordOperator = { fg = colors.peach },
            TSKeywordReturn = { fg = colors.red },
            TSLabel = { fg = colors.peach },
            TSLiteral = { link = 'String' },
            TSMath = { fg = colors.blue },
            TSMethod = { fg = colors.green },
            TSMethodCall = { fg = colors.green },
            TSNamespace = { fg = colors.yellow },
            TSNone = { fg = colors.text },
            TSNumber = { fg = colors.mauve },
            TSOperator = { fg = colors.peach },
            TSParameter = { fg = colors.text },
            TSParameterReference = { fg = colors.text },
            TSPreProc = { link = 'PreProc' },
            TSProperty = { fg = colors.blue },
            TSPunctBracket = { fg = colors.text },
            TSPunctDelimiter = { link = 'Delimiter' },
            TSPunctSpecial = { fg = colors.blue },
            TSRepeat = { fg = colors.red },
            TSStorageClass = { fg = colors.peach },
            TSStorageClassLifetime = { fg = colors.peach },
            TSStrike = { fg = colors.subtext2 },
            TSString = { fg = colors.teal },
            TSStringEscape = { fg = colors.green },
            TSStringRegex = { fg = colors.green },
            TSStringSpecial = { link = 'SpecialChar' },
            TSSymbol = { fg = colors.text },
            TSTag = { fg = colors.peach },
            TSTagAttribute = { fg = colors.green },
            TSTagDelimiter = { fg = colors.green },
            TSText = { fg = colors.green },
            TSTextReference = { link = 'Constant' },
            TSTitle = { link = 'Title' },
            TSTodo = { link = 'Todo' },
            TSType = { fg = colors.yellow, style = { 'bold' } },
            TSTypeBuiltin = { fg = colors.yellow, style = { 'bold' } },
            TSTypeDefinition = { fg = colors.yellow, style = { 'bold' } },
            TSTypeQualifier = { fg = colors.peach, style = { 'bold' } },
            TSURI = { fg = colors.blue },
            TSVariable = { fg = colors.text },
            TSVariableBuiltin = { fg = colors.mauve },

            ['@annotation'] = { link = 'TSAnnotation' },
            ['@attribute'] = { link = 'TSAttribute' },
            ['@boolean'] = { link = 'TSBoolean' },
            ['@character'] = { link = 'TSCharacter' },
            ['@character.special'] = { link = 'TSCharacterSpecial' },
            ['@comment'] = { link = 'TSComment' },
            ['@conceal'] = { link = 'Grey' },
            ['@conditional'] = { link = 'TSConditional' },
            ['@constant'] = { link = 'TSConstant' },
            ['@constant.builtin'] = { link = 'TSConstBuiltin' },
            ['@constant.macro'] = { link = 'TSConstMacro' },
            ['@constructor'] = { link = 'TSConstructor' },
            ['@debug'] = { link = 'TSDebug' },
            ['@define'] = { link = 'TSDefine' },
            ['@error'] = { link = 'TSError' },
            ['@exception'] = { link = 'TSException' },
            ['@field'] = { link = 'TSField' },
            ['@float'] = { link = 'TSFloat' },
            ['@function'] = { link = 'TSFunction' },
            ['@function.builtin'] = { link = 'TSFuncBuiltin' },
            ['@function.call'] = { link = 'TSFunctionCall' },
            ['@function.macro'] = { link = 'TSFuncMacro' },
            ['@include'] = { link = 'TSInclude' },
            ['@keyword'] = { link = 'TSKeyword' },
            ['@keyword.function'] = { link = 'TSKeywordFunction' },
            ['@keyword.operator'] = { link = 'TSKeywordOperator' },
            ['@keyword.return'] = { link = 'TSKeywordReturn' },
            ['@label'] = { link = 'TSLabel' },
            ['@math'] = { link = 'TSMath' },
            ['@method'] = { link = 'TSMethod' },
            ['@method.call'] = { link = 'TSMethodCall' },
            ['@namespace'] = { link = 'TSNamespace' },
            ['@none'] = { link = 'TSNone' },
            ['@number'] = { link = 'TSNumber' },
            ['@operator'] = { link = 'TSOperator' },
            ['@parameter'] = { link = 'TSParameter' },
            ['@parameter.reference'] = { link = 'TSParameterReference' },
            ['@preproc'] = { link = 'TSPreProc' },
            ['@property'] = { link = 'TSProperty' },
            ['@punctuation.bracket'] = { link = 'TSPunctBracket' },
            ['@punctuation.delimiter'] = { link = 'TSPunctDelimiter' },
            ['@punctuation.special'] = { link = 'TSPunctSpecial' },
            ['@repeat'] = { link = 'TSRepeat' },
            ['@storageclass'] = { link = 'TSStorageClass' },
            ['@storageclass.lifetime'] = { link = 'TSStorageClassLifetime' },
            ['@strike'] = { link = 'TSStrike' },
            ['@string'] = { link = 'TSString' },
            ['@string.escape'] = { link = 'TSStringEscape' },
            ['@string.regex'] = { link = 'TSStringRegex' },
            ['@string.special'] = { link = 'TSStringSpecial' },
            ['@symbol'] = { link = 'TSSymbol' },
            ['@tag'] = { link = 'TSTag' },
            ['@tag.attribute'] = { link = 'TSTagAttribute' },
            ['@tag.delimiter'] = { link = 'TSTagDelimiter' },
            ['@text'] = { link = 'TSText' },
            ['@text.danger'] = { link = 'TSDanger' },
            ['@text.diff.add'] = { link = 'diffAdded' },
            ['@text.diff.delete'] = { link = 'diffRemoved' },
            ['@text.emphasis'] = { link = 'TSEmphasis' },
            ['@text.environment'] = { link = 'TSEnvironment' },
            ['@text.environment.name'] = { link = 'TSEnvironmentName' },
            ['@text.literal'] = { link = 'TSLiteral' },
            ['@text.math'] = { link = 'TSMath' },
            ['@text.note'] = { link = 'TSNote' },
            ['@text.reference'] = { link = 'TSTextReference' },
            ['@text.strike'] = { link = 'TSStrike' },
            ['@text.strong'] = { link = 'TSStrong' },
            ['@text.title'] = { link = 'TSTitle' },
            ['@text.todo'] = { link = 'TSTodo' },
            ['@text.todo.checked'] = { link = 'Green' },
            ['@text.todo.unchecked'] = { link = 'Ignore' },
            ['@text.underline'] = { link = 'TSUnderline' },
            ['@text.uri'] = { link = 'TSURI' },
            ['@text.warning'] = { link = 'TSWarning' },
            ['@todo'] = { link = 'TSTodo' },
            ['@type'] = { link = 'TSType' },
            ['@type.builtin'] = { link = 'TSTypeBuiltin' },
            ['@type.definition'] = { link = 'TSTypeDefinition' },
            ['@type.qualifier'] = { link = 'TSTypeQualifier' },
            ['@uri'] = { link = 'TSURI' },
            ['@variable'] = { link = 'TSVariable' },
            ['@variable.builtin'] = { link = 'TSVariableBuiltin' },

            ['@lsp.type.class'] = { link = 'TSType' },
            ['@lsp.type.comment'] = { link = 'TSComment' },
            ['@lsp.type.decorator'] = { link = 'TSFunction' },
            ['@lsp.type.enum'] = { link = 'TSType' },
            ['@lsp.type.enumMember'] = { link = 'TSProperty' },
            ['@lsp.type.events'] = { link = 'TSLabel' },
            ['@lsp.type.function'] = { link = 'TSFunction' },
            ['@lsp.type.interface'] = { link = 'TSType' },
            ['@lsp.type.keyword'] = { link = 'TSKeyword' },
            ['@lsp.type.macro'] = { link = 'TSConstMacro' },
            ['@lsp.type.method'] = { link = 'TSMethod' },
            ['@lsp.type.modifier'] = { link = 'TSTypeQualifier' },
            ['@lsp.type.namespace'] = { link = 'TSNamespace' },
            ['@lsp.type.number'] = { link = 'TSNumber' },
            ['@lsp.type.operator'] = { link = 'TSOperator' },
            ['@lsp.type.parameter'] = { link = 'TSParameter' },
            ['@lsp.type.property'] = { link = 'TSProperty' },
            ['@lsp.type.regexp'] = { link = 'TSStringRegex' },
            ['@lsp.type.string'] = { link = 'TSString' },
            ['@lsp.type.struct'] = { link = 'TSType' },
            ['@lsp.type.type'] = { link = 'TSType' },
            ['@lsp.type.typeParameter'] = { link = 'TSTypeDefinition' },
            ['@lsp.type.variable'] = { link = 'TSVariable' },
          }
        end,
      },
    },
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    enabled = theme.github,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      local groups = {
        all = {
          SnacksPickerDir = { fg = '#8B949E', bg = nil, italic = false },
          FloatBorder = { fg = '#ffffff', bg = nil },
          BufferLineTabSelected = { fg = '#ffffff', bg = nil },
          BufferLineHintSelected = { fg = '#ffffff', bg = nil, italic = true },
          BufferLineHintDiagnosticSelected = { fg = '#ffffff', bg = nil },
          DiagnosticHint = { fg = '#ffffff', bg = nil },
          DiagnosticVirtualTextHint = { fg = '#ffffff', bg = nil },
          DiagnosticVirtualTextInfo = { fg = '#2f81f7', bg = nil },
          DiagnosticVirtualTextWarn = { fg = '#f7b83d', bg = nil },
          DiagnosticVirtualTextError = { fg = '#f85149', bg = nil },
          -- ['@tag'] = { fg = '#FFFFFF', bg = nil },
        },
      }

      require('github-theme').setup {
        groups = groups,
        options = {
          transparent = true, -- Disable setting the background color
          styles = {
            comments = 'italic',
            functions = 'italic',
          },
        },
      }

      vim.cmd 'colorscheme github_dark'
    end,
  },
}
