local status_ok, startup = pcall(require, "startup")
if not status_ok then
  vim.notify("Startup não funcionando")
 return
end

startup.setup {
 cabeca = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
          "██╗  ██╗░░░██╗░██████╗███████╗  ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗  ██████╗░████████╗██╗░░░░░░░░░██╗",
          "██║  ██║░░░██║██╔════╝██╔════╝  ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║  ██╔══██╗╚══██╔══╝██║░░███╗░░░██║",
          "██║  ██║░░░██║╚█████╗░█████╗░░  ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║  ██████╦╝░░░██║░░░╚██╗█████╗░██╔╝",
          "██║  ██║░░░██║░╚═══██╗██╔══╝░░  ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║  ██╔══██╗░░░██║░░░░████╔══█████║░",
          "██║  ╚██████╔╝██████╔╝███████╗  ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║  ██████╦╝░░░██║░░░░╚██╔╝░░╚██╔═╝░",
          "╚═╝  ░╚═════╝░╚═════╝░╚══════╝  ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝  ╚═════╝░░░░╚═╝░░░░░╚═╝░░░░╚═╝░░░",
        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
  corpo = {
    type = "mapping",
            oldfiles_directory = false,
            align = "center",
            fold_section = false,
            title = "Basic Commands",
            margin = 10,
            content = {
                { "  Projetos Recentes", "Telescope projects", "P"},
                { "  Encontrar Palavra", "Telescope live_grep", "p" },
                { "  Arquivos Recentes", "Telescope oldfiles", "r" },
                { "  Encontrar Arquivo", "Telescope file_browser", "a" },
                { "  Editar Plugins", ":e ~/.config/nvim/lua/plugins.lua", "e"},
                { "  Horas Trabalhadas Hoje", ":lua WakaTimeToday()", "t"},
                { "  Tema", "Telescope colorscheme", "c" },
                { "蘆 Sair", "q!", "q"},
            },
            highlight = "String",
            default_color = "",
            oldfiles_amount = 0,
  },
  rodape = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    margin = 10,
    highlight = "Statement",
    default_color = "",
    content = {
      " diego-rapoport",
      " @ X Digital Brasil",
      " Fullstack Developer( Angular, Node, MongoDB, Typescript)",
      "",
      " " .. os.date("%d/%m/%Y")
    }
  },
  options = {
    cursor_column = 0.65,
    empty_lines_between_mappings = false,
    disable_statuslines = true,
  },
  parts = {"cabeca", "corpo", "rodape"},
}
