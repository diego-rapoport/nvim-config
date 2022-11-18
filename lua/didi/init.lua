local subarquivos = require('utils.caminhos').gera_lista_subarquivos
local nome_arq = require('utils.caminhos').pega_nome_arquivo
local limpa_str = require('utils.strings').limpa_str

local configs = subarquivos('/home/dinhego/.config/nvim/lua')
for _, conf in ipairs(configs) do
  -- Lembrar de adicionar aqui caso pastas sejam adicionadas
  if(string.find(conf, 'didi') or string.find(conf, 'utils') or string.find(conf, 'ftplugin')) then goto continue end
  local arquivo = nome_arq(conf)
  local importar = limpa_str(arquivo, {'.lua'})
  require(importar)
  ::continue::
end

--[[ require 'options'
require 'keymaps'
require 'plugins'
require 'colors'
require '_cmp'
require '_lsp'
require '_treesitter'
require 'autopairs'
require '_bufferline'
require '_telescope'
require '_toggleterm'
require '_startup'
require 'autocmds'
require '_neorg' ]]
