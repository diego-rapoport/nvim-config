local status_ok, projections = pcall(require, "projections ")
if not status_ok then
	return
end

-- Bind <leader>fp to Telescope projections
require("telescope").load_extension("projections")
vim.keymap.set("n", "<leader>fp", function()
	vim.cmd("Telescope projections")
end)

-- Autostore session on DirChange and VimExit
local Session = projections.session --require("projections.session")
vim.api.nvim_create_autocmd({ "DirChangedPre", "VimLeavePre" }, {
	callback = function()
		Session.store(vim.loop.cwd())
	end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() == 0 then
			switcher.switch(vim.loop.cwd())
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() ~= 0 then
			return
		end
		local session_info = Session.info(vim.loop.cwd())
		if session_info == nil then
			Session.restore_latest()
		else
			Session.restore(vim.loop.cwd())
		end
	end,
	desc = "Restore last session automatically",
})

-- Create commands
vim.api.nvim_create_user_command("StoreProjectSession", function()
	Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
	Session.restore(vim.loop.cwd())
end, {})

local Workspace = require("projections.workspace")
-- Add workspace command
vim.api.nvim_create_user_command("AddWorkspace", function()
	Workspace.add(vim.loop.cwd())
end, {})
