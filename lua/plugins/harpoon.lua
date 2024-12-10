return {
  'ThePrimeagen/harpoon',
  enabled = false,
  event = 'VeryLazy',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local conf = require('telescope.config').values

    local function filenameFirst(path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == '.' then
        return tail
      end
      print(path)
      return string.format('%s\t\t%s', tail, parent)
    end

    local function toggle_telescope(harpoon_files)
      local file_paths_table = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths_table, { item.value, filenameFirst(item.value) })
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths_table,
            entry_maker = function(entry)
              return {
                value = entry,
                display = entry[2],
                path = entry[1],
                ordinal = entry[2],
              }
            end,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    local harpoon = require 'harpoon'

    local map = vim.keymap.set
    map('n', '<leader>m', function()
      harpoon:list():add()
    end, { desc = 'Add current buffer to Harpoon' })
    map('n', '<leader><leader>', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Toggle Harpoon Menu' })
    map('n', '<leader>j', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon Buffer Menu' })
    map('n', 'H', function()
      harpoon:list():prev()
    end, { desc = 'Previous Harpoon item' })
    map('n', 'L', function()
      harpoon:list():next()
    end, { desc = 'Next Harpoon item' })
  end,

  opts = {},
}
