local fn = vim.fn
local notify = vim.notify

-- Instala packer automagicamente
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Instalando packer, feche e reabra o neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	notify("Status " .. status_ok .. " Packer")
	return
end

packer.init({
	-- packer roda num popup
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	auto_clean = false, -- não remove pacotes não utilizados
})

-- PLUGINS
packer.startup(function(use)
	-- o próprio packer
	use("wbthomason/packer.nvim")

	-- requerido por muitos plugins
	use("nvim-lua/plenary.nvim")

	-- popup API
	use("nvim-lua/popup.nvim")

	-- colorschemes
	use("marko-cerovac/material.nvim")
	use("EdenEast/nightfox.nvim")
	use("lunarvim/colorschemes")

	-- fuzzy
	use({ "tzachar/fuzzy.nvim", require = { "nvim-telescope/telescope-fzf-native.nvim" } })

	-- cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("lukas-reineke/cmp-rg")
	use("David-Kunz/cmp-npm")
	use("petertriho/cmp-git")
	use("f3fora/cmp-spell")
	use("tzachar/cmp-fuzzy-buffer")
	use("tzachar/cmp-fuzzy-path")
	use("chrisgrieser/cmp-nerdfont")
	use("pontusk/cmp-vimwiki-tags")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-github.nvim" },
			{ "nvim-telescope/telescope-project.nvim" },
		},
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-symbols.nvim")
	use("LinArcx/telescope-env.nvim")
	use("keyvchan/telescope-find-pickers.nvim")
	use("adoyle-h/lsp-toggle.nvim")
	use({
		"benfowler/telescope-luasnip.nvim",
		module = "telescope.extensions.luasnip",
	})
	use("octarect/telescope-menu.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- use 'p00f/nvim-ts-rainbow'
	use("RRethy/nvim-treesitter-endwise")
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("neoclip").setup()
		end,
	})

	-- Dashboard incial
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup("startup.lua")
		end,
	})

	-- Projects
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				scope_chdir = "tab",
			})
		end,
	})

	-- Notificações
	use("rcarriga/nvim-notify")

	-- GIT
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("kdheepak/lazygit.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Modo Zen
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen")
		end,
	})

	-- NEORG
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.integrations.telescope"] = {},
					["core.norg.concealer"] = {},
					["core.export.markdown"] = {},
					["core.presenter"] = {
						config = {
							zen_mode = "zen-mode",
						},
					},
					["core.export"] = {
						config = {
							extensions = "all",
						},
					},
					["core.gtd.base"] = {
						config = {
							workspace = "tasks",
						},
					},
					["core.norg.dirman"] = {
						config = {
							workspaces = {
								norgs = "~/Documentos/Norgs",
								tasks = "~/Documentos/Norgs/Tasks",
							},
							autochdir = true,
							index = "index.norg",
							defaut_workspace = "~/Documentos/Norgs",
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
			})
		end,
		-- ft = 'norg',
		after = "nvim-treesitter",
		run = ":Neorg sync-parsers",
		requires = "nvim-neorg/neorg-telescope",
	})

	-- Whichkey
	use({
		"folke/which-key.nvim",
		config = function()
			require("whichkey")
		end,
	})

	-- Icons
	use("kyazdani42/nvim-web-devicons")
	--[[ use {
    'yamatsum/nvim-nonicons',
    requires = 'kyazdani42/nvim-web-devicons'
  } ]]

	-- Project Mindmap
	use({
		"phaazon/mind.nvim",
		config = function()
			require("mind").setup()
		end,
	})

	-- DAP(debugger)
	use("mfussenegger/nvim-dap")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Buffers em tabs
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
	})
	--use 'moll/vim-bbye'

	-- Ranger
	use("kevinhwang91/rnvimr")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- WakaTime time tracker
	use("wakatime/vim-wakatime")

	-- Java
	use({ "mfussenegger/nvim-jdtls" })

	-- FSRead (melhora leitura)
	use("nullchilly/fsread.nvim")

	-- ChatGPT
	use({
		"terror/chatgpt.nvim",
		run = "pip3 install -r requirements.txt",
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
