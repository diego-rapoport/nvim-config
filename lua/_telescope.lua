local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify('Telescope não encontrado!')
  return
end

telescope.load_extension('gh')
telescope.load_extension('project')
telescope.load_extension('neoclip')
telescope.load_extension('env')
telescope.load_extension('menu')
-- telescope.load_extension('luasnip')

require('lsp-toggle').setup()

local config_caminho = '/home/dinhego/.config/nvim/lua'
local mod_caminhos = require('./utils/caminhos')
local limpa_str = require('./utils/strings').limpa_str
local capitalizar = require('./utils/strings').capitalizar

local caminhos_config = mod_caminhos.gera_lista_subarquivos(config_caminho)

local function cria_tabela_configs(caminhos)
  local data = {}
  for i, f in ipairs(caminhos) do
    for encontrado in f:gmatch('/[%a_]+%.lua') do
      local nome_upper = capitalizar(limpa_str(encontrado, { '/', '_', '%.lua'}))
      table.insert(data, { caminhos[i], nome_upper })
    end
  end
  return data
end

local tabela_configs = cria_tabela_configs(caminhos_config)

local function gera_tabela_items(tabela)
  local items = {}
  for _, value in ipairs(tabela) do
    table.insert(items, { value[2], 'e ' .. value[1] })
  end
  return items
end
local items = gera_tabela_items(tabela_configs)

telescope.extensions.menu.menu = nil
return telescope.setup {
  extensions = {
    project = {
      base_dirs = {
        { path = '~/Programação', max_depth = 4 },
      },
    },
    menu = {
      default = {
        items = {
          { "Configs", "Telescope menu configs" },
        },
      },
      configs = {
        items = items
      }
    }
  }
}
