local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
 return
end

require("nvim-treesitter.configs").setup {
  ensure_installed = {"javascript", "typescript", "python", "lua", "markdown", "rust"},
  sync_install = false,
  ignore_install = {"haskell"},
  highlight = {
    enable = true,
    additional_vim_regex_highlightning = true,
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  enwise = {
    enable = true
  },
}

vim.cmd "set foldmethod=expr"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
vim.cmd "set nofoldenable"
