local status_ok, null = pcall(require, "null-ls")
if not status_ok then
  vim.notify('Null não ok!')
 return
end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics
local completion = null.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null.setup {
  sources = {
    formatting.stylua,
    formatting.prettier.with({extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote"}}),
    diagnostics.eslint,
    diagnostics.tsc,
    completion.spell,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({bufnr=bufnr})
        end,
      })
    end
  end,
}
