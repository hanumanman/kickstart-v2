return {
  -- 'echasnovski/mini.nvim',
  -- keys = {
  --   {
  --     ',',
  --     function()
  --       require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
  --     end,
  --     mode = 'n',
  --     desc = 'Open Mini.files',
  --   },
  -- },
  -- config = function()
  --   require('mini.ai').setup { n_lines = 500 }
  --   require('mini.files').setup {
  --     mappings = {
  --       synchronize = 's',
  --     },
  --   }
  -- end,
  --
  { 'echasnovski/mini.ai', version = '*', opts = {
    n_lines = 500,
  } },
}
