local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  s({ trig = 'afn', name = 'Arrow function' }, {
    t '(',
    i(1),
    t ') => {',
    i(2),
    t '}',
  }),
}
