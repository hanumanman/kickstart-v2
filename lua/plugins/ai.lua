return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = false,
          keymap = {
            accept = '<C-k>',
            next = '<C-j>',
          },
        },
        panel = {
          enabled = false,
        },
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    enabled = true,
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    -- build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
    },
    -- :CopilotChatExplain - Write an explanation for the active selection as paragraphs of text
    -- :CopilotChatReview - Review the selected code
    -- :CopilotChatFix - There is a problem in this code. Rewrite the code to show it with the bug fixed
    -- :CopilotChatOptimize - Optimize the selected code to improve performance and readability
    -- :CopilotChatDocs - Please add documentation comment for the selection
    -- :CopilotChatTests - Please generate tests for my code
    -- :CopilotChatFixDiagnostic - Please assist with the following diagnostic issue in file
    keys = {
      {
        '<leader>aa',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatOpen<cr>',
        desc = 'Copilot Chat',
      },
      {
        '<leader>ae',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatExplain<cr>',
        desc = 'Copilot Chat Explain',
      },
      {
        '<leader>ar',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatReview<cr>',
        desc = 'Copilot Chat Review',
      },
      {
        '<leader>af',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatFix<cr>',
        desc = 'Copilot Chat Fix',
      },
      {
        '<leader>ao',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatOptimize<cr>',
        desc = 'Copilot Chat Optimize',
      },
      {
        '<leader>ad',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatDocs<cr>',
        desc = 'Copilot Chat Docs',
      },
      {
        '<leader>at',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatTests<cr>',
        desc = 'Copilot Chat Tests',
      },
      {
        '<leader>ac',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatFixDiagnostic<cr>',
        desc = 'Copilot Chat Fix Diagnostic',
      },
    },
  }  --   config = function()
  --     require('supermaven-nvim').setup {
  --       color = {
  --         suggestion_color = '#9CA1AA',
  --         cterm = 244,
  --       },
  --     }
  --   end,
  -- },
, -- { -- ,{ --   'supermaven-inc/supermaven-nvim', --   lazy = false, --   enabled = true,
}
