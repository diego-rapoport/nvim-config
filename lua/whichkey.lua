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
  p = {
    name = "Projetos",
    r = {'<cmd>lua require"telescope".extensions.projects.projects{}<cr>', "Abre projetos recentes"},
  }
}, nopts)

wk.register({
    s = {
        name = 'search',
        F = {'<cmd>Telescope filetypes<cr>', 'Tipos de arquivos'},
        d = {'<cmd>Telescope lsp_document_diagnostics<cr>', 'Diagnósticos de documento'},
        D = {'<cmd>Telescope lsp_workspace_diagnostics<cr>', 'Diagnósticos de ambiente de espaço'},
        f = {'<cmd>Telescope find_files<cr>', 'Achar arquivos'},
        h = {'<cmd>Telescope command_history<cr>', 'Histórico'},
        i = {'<cmd>Telescope media_files<cr>', 'Arquivos de mídia'},
        m = {'<cmd>Telescope marks<cr>', 'Marcas'},
        M = {'<cmd>Telescope man_pages<cr>', 'Arquivos man'},
        o = {'<cmd>Telescope vim_options<cr>', 'Opções do vim'},
        t = {'<cmd>Telescope live_grep<cr>', 'Grep ao vivo'},
        r = {'<cmd>Telescope registers<cr>', 'Registros'},
        w = {'<cmd>Telescope file_browser<cr>', 'Encontrar arquivo'},
        u = {'<cmd>Telescope colorscheme<cr>', 'Cores de sistema'},
    },
}, nopts)

