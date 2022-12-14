local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end


npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" }
  },
  disable_filetype = {
    "TelescopePrompt", "spectre_panel"
  },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'"},
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = '$',
    keys = 'qwertyuiopasdfghjklçzxcvbnm',
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr"
  }
}
