return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local harpoon = require 'harpoon'
    local harpoon_extensions = require 'harpoon.extensions'

    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
    harpoon:setup()

    local map = vim.keymap.set
    map('n', '<leader>ba', function()
      harpoon:list():add()
    end, { desc = 'Add current buffer to Harpoon' })
    map('n', '<leader>a', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon Buffer Menu' })
    map('n', 'H', function()
      harpoon:list():prev { ui_nav_wrap = true }
    end, { desc = 'Previous Harpoon item' })
    map('n', 'L', function()
      harpoon:list():next { ui_nav_wrap = true }
    end, { desc = 'Next Harpoon item' })
  end,
}
