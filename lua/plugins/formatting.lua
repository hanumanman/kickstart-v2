return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- keys = { {
  --   '<leader>f',
  --   function()
  --     require('conform').format { async = true }
  --   end,
  --   mode = '',
  --   desc = 'Format',
  -- } },
  config = function()
    ---@type conform.setupOpts
    require('conform').setup {
      notify_on_error = true,
      default_format_opts = {
        lsp_format = 'fallback',
        stop_after_first = true,
      },
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        graphql = { 'prettierd' },
        svelte = { 'prettierd' },
      },
    }
  end,
}
