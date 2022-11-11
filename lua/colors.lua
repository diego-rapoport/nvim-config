local colorscheme = "lunar"

local status_ok, _ = pcall(vim.cmd, "colorscheme ", colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " não encontrado!")
  colorscheme = "default"
  return
end
vim.api.nvim_exec("colorscheme " .. colorscheme, false)
