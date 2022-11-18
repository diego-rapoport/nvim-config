local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    -- indicator_style = '⎹',
    sort_by = 'insert_after_current',
    diagnostics = 'nvim_lsp',
    separator_style = "slant",
    always_show_bufferline = true,
    show_close_icon = false,
    offsets = {
      {
        filetype = 'mind',
        text = ' Mind',
        text_align = 'center',
      },
      {
        filetype = 'DiffviewFiles',
        text = ' Diff View',
        text_align = 'center',
      },
      {
        filetype = 'Outline',
        text = 'Symbols',
        text_align = 'center',
      },
      {
        filetype = 'packer',
        text = ' Packer',
        text_align = 'center',
      },
    },
    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
        local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
        local info = #vim.diagnostic.get(0, { severity = seve.INFO })
        local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, fg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
        end
        return result
      end,
    },
  },
}
