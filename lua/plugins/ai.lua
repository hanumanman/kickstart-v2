return {
  -- {
  --   'zbirenbaum/copilot.lua',
  --   branch = 'create-pull-request/update-copilot-dist',
  --   enabled = true,
  --   event = 'InsertEnter',
  --   config = function(_, opts)
  --     local new_opts = vim.tbl_extend('force', opts, {
  --       server_opts_overrides = {
  --         cmd = {
  --           'node',
  --           vim.api.nvim_get_runtime_file('copilot/dist/language-server.js', false)[1],
  --           '--stdio',
  --         },
  --         init_options = {
  --           copilotIntegrationId = 'vscode-chat',
  --         },
  --       },
  --
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         keymap = {
  --           accept = '<C-k>',
  --           accept_word = '<C-l>',
  --           next = '<C-j>',
  --         },
  --       },
  --       panel = {
  --         enabled = false,
  --       },
  --     })
  --
  --     require('copilot').setup(new_opts)
  --
  --     local util = require 'copilot.util'
  --     local orig_get_editor_configuration = util.get_editor_configuration
  --
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     util.get_editor_configuration = function()
  --       local config = orig_get_editor_configuration()
  --
  --       return vim.tbl_extend('force', config, {
  --         github = {
  --           copilot = {
  --             selectedCompletionModel = 'gpt-4o-copilot',
  --           },
  --         },
  --       })
  --     end
  --
  --     return new_opts
  --   end,
  -- },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          clear_suggestion = '<C-]>',
          accept_suggestion = '<C-k>',
          accept_word = '<C-j>',
        },
      }
    end,
  },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   enabled = true,
  --   branch = 'main',
  --   dependencies = {
  --     { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
  --     { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     debug = false,
  --   },
  --   keys = {
  --     {
  --       '<leader>aa',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatOpen<cr>',
  --       desc = 'Copilot Chat',
  --     },
  --     {
  --       '<leader>ae',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatExplain<cr>',
  --       desc = 'Copilot Chat Explain',
  --     },
  --     {
  --       '<leader>ar',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatReview<cr>',
  --       desc = 'Copilot Chat Review',
  --     },
  --     {
  --       '<leader>af',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatFix<cr>',
  --       desc = 'Copilot Chat Fix',
  --     },
  --     {
  --       '<leader>ao',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatOptimize<cr>',
  --       desc = 'Copilot Chat Optimize',
  --     },
  --     {
  --       '<leader>ad',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatDocs<cr>',
  --       desc = 'Copilot Chat Docs',
  --     },
  --     {
  --       '<leader>at',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatTests<cr>',
  --       desc = 'Copilot Chat Tests',
  --     },
  --     {
  --       '<leader>ac',
  --       mode = { 'n', 'v' },
  --       '<cmd>CopilotChatFixDiagnostic<cr>',
  --       desc = 'Copilot Chat Fix Diagnostic',
  --     },
  --   },
  -- },
}
