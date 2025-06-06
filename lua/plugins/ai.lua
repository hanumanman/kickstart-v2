return {
  -- ,
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
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = true,
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
      window = {
        title = 'Haha ngu',
      },
      model = 'claude-3.7-sonnet',
    },
    keys = {
      {
        '<leader>o',
        mode = { 'n', 'v' },
        '<cmd>CopilotChatToggle<cr>',
        desc = 'Copilot Chat Toggle',
      },
    },
  },
}
