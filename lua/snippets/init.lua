-- Load custom snippets
local ls = require 'luasnip'

-- Load JSON snippets for both json and jsonc files
local json_snippets = require 'snippets.json'
ls.add_snippets('json', json_snippets)
ls.add_snippets('jsonc', json_snippets)
