return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<C-k>',
            accept_word = '<C-l>',
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
    enabled = true,
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
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
  },
}
