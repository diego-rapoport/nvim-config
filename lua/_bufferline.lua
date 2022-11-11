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
  }
}
