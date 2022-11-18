local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('reqlsp', {
    t('require("lspconfig").'),
    i(1),
    t('.setup{'),
    i(2),
    t('}')
  })
}
