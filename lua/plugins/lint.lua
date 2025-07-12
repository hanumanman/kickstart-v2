return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      javascript = { 'oxlint' },
      javascriptreact = { 'oxlint' },
      typescript = { 'oxlint' },
      typescriptreact = { 'oxlint' },
    }
  end,
}
