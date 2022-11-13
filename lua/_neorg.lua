local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
  return
end

return neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.concealer"] = {},
    ["core.export.markdown"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = 'zen-mode'
      }
    },
    ["core.export"] = {
      config = {
        extensions = "all"
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "tasks",
      }
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          norgs = "~/Documentos/Norgs",
          tasks = "~/Documentos/Norgs/Tasks"
        },
        autochdir = true,
        index = "index.norg",
        defaut_workspace = "~/Documentos/Norgs"
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybindins = true,
        neorg_leader = "<leader>o",
      },
    },
  },
}
