return {
  'echasnovski/mini.nvim',
  keys = {
    {
      ',',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      mode = 'n',
      desc = 'Open Mini.files',
    },
  },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    require('mini.files').setup()
  end,
}
