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
  config = function()
    ---@type conform.setupOpts
    require('conform').setup {
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
      },
    }

    -- Run sort imports before formatting
    vim.api.nvim_create_autocmd('User', {
      pattern = { 'ConformFormatPre' },
      callback = function()
        -- Check if vtsls LSP is active
        local is_vtsls_active = false
        for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
          if client.name == 'vtsls' then
            is_vtsls_active = true
            break
          end
        end

        if is_vtsls_active then
          vim.cmd 'VtsExec sort_imports'
        end
      end,
    })
  end,
}
