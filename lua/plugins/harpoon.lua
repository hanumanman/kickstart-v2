return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- basic telescope configuration
    local conf = require('telescope.config').values

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    local harpoon = require 'harpoon'
    harpoon:setup()

    local map = vim.keymap.set
    map('n', '<leader>m', function()
      harpoon:list():add()
    end, { desc = 'Add current buffer to Harpoon' })
    map('n', '<leader><leader>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Toggle Harpoon Menu' })
    map('n', '<leader>j', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    map('n', '<leader><C-i>', function()
      harpoon:list():prev()
    end, { desc = 'Previous Harpoon item' })
    map('n', '<C-i>', function()
      harpoon:list():next()
    end, { desc = 'Next Harpoon item' })
  end,
}
