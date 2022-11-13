local augroup = vim.api.nvim_create_augroup
local aucmd = vim.api.nvim_create_autocmd

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]] -- Pisca quando copia texto

-- Seta o separador como uma linha toda vez que abre um split
local function set_split_separator()
  vim.api.nvim_cmd({ cmd = "highlight", args = {"WinSeparator", "guibg=None"}}, {})
end

local separator = augroup('Separator', {clear = false})
aucmd({'WinEnter'}, {
  pattern = {"*"},
  callback = set_split_separator,
  group = separator,
})

-- Roda a sincronização do Packer toda vez que o plugins.lua é salvo
local grupo_packer_didi_config = augroup("PackerDidiConfig", { clear = true })
aucmd("BufWritePost", { command = "source % | PackerSync", pattern = "plugins.lua", group = grupo_packer_didi_config })

