return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    -- {
    --   '<leader>f',
    --   function()
    --     require('conform').format { async = true }
    --   end,
    --   mode = '',
    --   desc = 'Format',
    -- },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    notify_on_error = true,
    default_format_opts = {
      lsp_format = 'fallback',
      stop_after_first = true,
    },
    format_on_save = function()
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,

    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'prettierd', 'prettier' },
      jsonc = { 'prettierd', 'prettier' },
      yaml = { 'prettierd', 'prettier' },
      markdown = { 'prettierd', 'prettier' },
      html = { 'prettierd', 'prettier' },
      css = { 'prettierd', 'prettier' },
      scss = { 'prettierd', 'prettier' },
      javascript = { 'prettierd', 'prettier' },
      typescript = { 'prettierd', 'prettier' },
      javascriptreact = { 'prettierd', 'prettier' },
      typescriptreact = { 'prettierd', 'prettier' },
      graphql = { 'prettierd', 'prettier' },
      svelte = { 'prettierd', 'prettier' },
    },
  },
}
