local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify('Telescope não encontrado!')
 return
end

telescope.load_extension('gh')
telescope.load_extension('project')

telescope.setup {
  extensions = {
    project = {
      base_dirs = {
        {path = '~/Programação', max_depth = 4},
        {'/home/dinhego/Programação', max_depth = 2},
      },
    }
  }
}
