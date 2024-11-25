return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  init = function()
    -- Automatically resume sesssion
    vim.api.nvim_create_autocmd({ 'VimEnter' }, {
      callback = function()
        require('persistence').load()
      end,
    })
  end,
  opts = {},
}
