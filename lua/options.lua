-- :help options
local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" }, -- cmp config
  conceallevel = 0, -- `` visível em arquivos markdown
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  pumheight = 10, -- altura do menu de pop up
  showmode = false, -- faz o modo tipo -- INSERT -- desaparecer
  showtabline = 2, -- sempre mostrar tabs
  smartcase = true,
  smartindent = true,
  splitbelow = true, -- força splits horizontais a abrir abaixo
  splitright = true, -- força splits verticais a abrir na direita
  swapfile = false,
  timeoutlen = 300, -- tempo de espera para uma sequência mapeada ser completada
  undofile = true, -- persistir desfazer(undo)
  updatetime = 300,
  writebackup = false,
  expandtab = true, -- converte tabs em espaços
  shiftwidth = 2, -- número padrão de espaços depois de cada indentação
  tabstop = 2, -- insere 2 espaços pra um TAB
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false, -- coloca linhas longas
  scrolloff = 10, -- mantém o cursos mais no centro possível
  sidescrolloff = 10,
  termguicolors = true,
  laststatus = 3, -- Deixa só uma linha de status
}

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd "set completeopt=menu,menuone,noselect"

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
{ virtual_text = false })

for k, v in pairs(options) do
  vim.opt[k] = v
end
