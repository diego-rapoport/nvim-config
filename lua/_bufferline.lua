local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    diagnostics = 'nvim_lsp',
    separator_style = "slant",
    always_show_bufferline = true,
    show_close_icon = false,
    offsets = {
      {
        filetype = 'mind',
        text = ' Mind',
        -- highlight = 'PanelHeading',
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
    }
  },
}
