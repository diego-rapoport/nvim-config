require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "angularls",
    "bashls",
    "cssls",
    "dockerls",
    "dotls",
    "eslint",
    "html",
    "jsonls",
    "tsserver",
    "sumneko_lua",
    "marksman",
    "pyright",
    "rust_analyzer",
    "tailwindcss",
    "diagnosticls",
  },
})

require("lspconfig").angularls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").diagnosticls.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").dotls.setup({})
-- require('lspconfig').eslint.setup{}
require("lspconfig").efm.setup({})
require("lspconfig").html.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").sumneko_lua.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").tailwindcss.setup({
  filetypes = { "javascriptreact", "typescriptreact", "css", "html" },
})
require("lspconfig").jdtls.setup({})
