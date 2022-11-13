local M = {}

function M.gera_lista_subarquivos(caminho)
  local scan = require('plenary.scandir').scan_dir
  local arquivos = {}

  for _, caminho_arquivo in ipairs(scan(caminho)) do
    table.insert(arquivos, caminho_arquivo)
  end

  return arquivos
end

return M

