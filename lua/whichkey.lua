local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

local nopts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- Registros básicos
wk.register({
  h = {"<cmd>nohls<cr>", "Desliga seleção"},
}, nopts)
wk.register({
  q = {"<cmd>q<cr>", "Sair!"},
}, nopts)
wk.register({
  r = {"<cmd>RnvimrToggle<cr>", "Abre ranger"},
}, nopts)
wk.register({
  c = {"<cmd>Bdelete!<cr>", "Fecha o buffer"}
}, nopts)


-- Registros aninhados
wk.register({
  g = {
    name = "Lazygit",
    g = {"<cmd>LazyGitCurrentFile<cr>", "Abre lazygit no arquivo atual"},
    c = {"<cmd>LazyGiConfig<cr>", "Abre configs do lazygit"}
  }
})

wk.register({
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    --f = { "<cmd>vim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
}, nopts)

wk.register({
    s = {
        name = 'search',
        F = {':Telescope filetypes<cr>', 'filetypes'},
        d = {':Telescope lsp_document_diagnostics<cr>', 'document_diagnostics'},
        D = {':Telescope lsp_workspace_diagnostics<cr>', 'workspace_diagnostics'},
        f = {':Telescope find_files<cr>', 'files'},
        h = {':Telescope command_history<cr>', 'history'},
        i = {':Telescope media_files<cr>', 'media files'},
        m = {':Telescope marks<cr>', 'marks'},
        M = {':Telescope man_pages<cr>', 'man_pages'},
        o = {':Telescope vim_options<cr>', 'vim_options'},
        t = {':Telescope live_grep<cr>', 'text'},
        r = {':Telescope registers<cr>', 'registers'},
        w = {':Telescope file_browser<cr>', 'buf_fuz_find'},
        u = {':Telescope colorscheme<cr>', 'colorschemes'},
    },
}, nopts)

