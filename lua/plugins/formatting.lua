return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
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
        json = { 'prettier' },
        jsonc = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        graphql = { 'prettier' },
        svelte = { 'prettier' },
        sh = { 'shfmt' },
      },
    }
  end,
}
