local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

return {
    s('prettier', {
        t {
            '{',
            '  "semi": false,',
            '  "singleQuote": false,',
            '  "useTabs": false,',
            '  "tabWidth": 2,',
            '  "trailingComma": "es5",',
            '  "printWidth": 80,',
            '  "bracketSpacing": true,',
            '  "arrowParens": "avoid",',
            '  "endOfLine": "lf"',
            '}',
        },
    }),
}
