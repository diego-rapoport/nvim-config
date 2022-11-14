local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    diagnostics = true,
    separator_style = "slant",
    always_show_bufferline = true,
  },
  offsets = {
    {
      filetype = 'mind',
      text = ' Mind',
      highlight = 'PanelHeading',
      text_align = 'center',
    },
    {
      filetype = ' DiffviewFiles',
      text = 'Diff View',
      highlight = 'PanelHeading',
      text_align = 'center',
    },
    {
      filetype = 'Outline',
      text = 'Symbols',
      highlight = 'PanelHeading',
      text_align = 'center',
    },
    {
      filetype = 'packer',
      text = ' Packer',
      highlight = 'PanelHeading',
      text_align = 'center',
    },
  }
}
