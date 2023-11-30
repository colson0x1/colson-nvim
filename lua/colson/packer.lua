vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("christoomey/vim-tmux-navigator")
	use("leafOfTree/vim-matchtag")
	-- Displays color code
	use("norcalli/nvim-colorizer.lua")

	-- Auto Save
	use("0x00-ketsu/autosave.nvim")

	--[[ 
    @ Install live-server using NODE
	  sudo npm i -g live-server
	  Start server- :LiveServerStart
	  Stop server- :LiveServerStop
  ]]
	--
	use({
		"barrett-ruth/live-server.nvim",
		config = function()
			require("live-server").setup({
				port = 3000,
				log = false,
				index = "index.html", -- Specify the default index file
				htmllint = false,
				open_browser = false, -- Automatically open the browser when starting the server
			})
		end,
	})

	-- Formatting and Linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("nvim-tree/nvim-tree.lua")
	use("numToStr/Comment.nvim")
	use("kyazdani42/nvim-web-devicons")

	use("andweeb/presence.nvim")

	-- /* IDE Theme (Enable Only One) : THREE Themes at the Moment! */

	-- @ Github Themes
	use({ "projekt0n/github-nvim-theme" })

	-- @ JetBrains IDE Theme
	--[[
	use({
		"doums/darcula",
		as = "darcula",
		config = function()
			vim.cmd("colorscheme darcula")
		end,
	})
  --]]

	-- @ Tokyo Night Theme
	--[[
	use({
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	})
  --]]

	-- @ Catppuccin Theme
	--[[
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	})
  --]]

	-- @ Rose Pine Theme
	--[[
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})
  --]]
end)
