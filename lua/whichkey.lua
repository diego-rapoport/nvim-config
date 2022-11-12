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
  ['/'] = {"<Plug>(comment_toggle_linewise_current)", "Comentar código"},
}, nopts)
wk.register({
  ['/'] = {"<Plug>(comment_toggle_blockwise_visual)", "Comentar código"},
}, vopts)
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
  c = {"<cmd>Bdelete!<cr>", "Fecha o buffer"},
}, nopts)

-- Registros aninhados
wk.register({
  C = {
    name = "Configs",
    t = {"<cmd>e ~/.config/nvim/lua/_telescope.lua"},
  }
}, nopts)

wk.register({
  g = {
    name = "Lazygit",
    g = {"<cmd>LazyGitCurrentFile<cr>", "Abre lazygit no arquivo atual"},
    c = {"<cmd>LazyGiConfig<cr>", "Abre configs do lazygit"},
  },
}, nopts)

wk.register({
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Ação de código" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Diagnósticos de Buffer" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnósticos" },
    f = { "<cmd>vim.lsp.buf.formatting_sync()<cr>", "Formatar" },
    i = { "<cmd>LspInfo<cr>", "Informações" },
    I = { "<cmd>Mason<cr>", "Mason" },
    j = {
      vim.diagnostic.goto_next,
      "Próximo Diagnóstico",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Diagnóstico Anterior",
    },
    l = { vim.lsp.codelens.run, "Ação Code Lens" },
    q = { vim.diagnostic.setloclist, "Conserto rápido" },
    r = { vim.lsp.buf.rename, "Renomear" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Símbolos de Documento" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Símbolos do Ambiente de Espaço",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Conserto Rápido do Telescope" },
  },
}, nopts)

wk.register({
  p = {
    name = "Projetos",
    r = {'<cmd>lua require"telescope".extensions.projects.projects{}<cr>', "Abre projetos recentes"},
    s = {'<cmd>Telescope symbols', "Busca de emojis"},
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
