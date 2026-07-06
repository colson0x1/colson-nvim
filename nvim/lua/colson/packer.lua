-- ============================================================================
-- ⚠ LEGACY REFERENCE ONLY - NOT LOADED (since 2026-07-06)
-- ============================================================================
-- This was the Packer-era plugin spec. The config migrated to lazy.nvim
-- (packer.nvim was archived upstream in Aug 2023). The live plugin specs now
-- live in lua/colson/plugins/*.lua - every entry below, including commented
-- ones, was ported there 1:1. This file is kept for history/reference and is
-- no longer require()'d from init.lua.
-- ============================================================================

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Telescope - UPDATED for 0.11.x compatibility
	use({
		"nvim-telescope/telescope.nvim",
		branch = "master", -- Use latest instead of old 0.1.4
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("christoomey/vim-tmux-navigator")
	use("leafOfTree/vim-matchtag")
	-- Displays color code
	use("norcalli/nvim-colorizer.lua")

	-- Rainbow Parenthesis
	-- use("HiPhish/nvim-ts-rainbow2")

	-- HTTP Client
	use("BlackLight/nvim-http")

	-- HTTP REST Client / TEST API
	--[[ use({
		"rest-nvim/rest.nvim",
		requires = {
			"nvim-lua/plenary.nvim", -- Required for rest.nvim
			-- "j-hui/fidget.nvim", -- For showing request progress messages
			-- "Lua-cURL/Lua-cURLv3", -- Optional: For handling advanced curl requests
			-- "tami5/xml2lua", -- For parsing XML request bodies
			-- "jubnzv/mimetypes", -- For detecting file MIME types in external body files
			-- "miversen33/nvim-nio", -- For async execution in rest.nvim
			"nvim-neotest/nvim-nio", -- Alternative for async execution in rest.nvim
		},
		config = function()
			require("plugin.http-rest-client")
		end,
	}) ]]

	-- @ RESTY HTTP REST Client
	use({
		"lima1909/resty.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		--[[ config = function()
			require("after.plugin.http-rest-client")
		end, ]]
	})
	-- RESTY Dependency (DISABLED - Missing dependencies)
	-- rest.nvim requires: fidget.nvim, xml2lua, mimetypes, nvim-nio, tree-sitter-http
	-- Use resty.nvim (above) instead for HTTP REST client functionality
	--[[
	use({
		"NTBBloodbath/rest.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-neotest/nvim-nio",
			"j-hui/fidget.nvim",
		},
	})
	--]]

	-- Auto Save
	use("0x00-ketsu/autosave.nvim")

	-- Git Diff
	use("sindrets/diffview.nvim")

	-- Git Merge
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		--[[ config = function()
			require("git-merge-conflict")
		end, ]]
	})
	-- For enhanced quickfix handling @ nvim-pqf
	use({
		"yorickpeterse/nvim-pqf",
		config = function()
			require("pqf").setup()
			--[[ config = function()
			require("pqf").setup({
				signs = {
					error = "E",
					warning = "W",
					info = "I",
					hint = "H",
				},
			}) ]]
		end,
	})

	-- Git Rebase Diff
	use({
		"yutkat/git-rebase-auto-diff.nvim",
		ft = { "gitrebase" },
		config = function()
			require("git-rebase-auto-diff").setup()
		end,
	})

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

	-- Tabs Bufferline
	-- Uncomment to Enable Tab based File Buffer
	--[[
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
	})
  --]]

	-- @ React Snippets
	--[[
	use({
		"epilande/vim-react-snippets",
		requires = {
			{ "epilande/vim-es2015-snippets" },
			{ "SirVer/ultisnips" },
		},
		fs = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	})
  --]]

	use("nikvdp/ejs-syntax")

	use({
		"mlaursen/vim-react-snippets",
		requires = {
			{ "SirVer/ultisnips" },
		},
		fs = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	})

	-- Formatting and Linting - FIXED for 0.11.x (null-ls archived, using none-ls)
	use("nvimtools/none-ls.nvim") -- Maintained fork of null-ls
	use("jay-babu/mason-null-ls.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("windwp/nvim-autopairs")
	-- use("windwp/nvim-ts-autotag")

	use("nvim-lua/plenary.nvim")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use("mattn/emmet-vim")

	-- JSX/TSX Comment
	use("JoosepAlviste/nvim-ts-context-commentstring")

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

	-- Java Development - Enterprise Grade Setup
	use({
		"nvim-java/nvim-java",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			{ "nvim-java/lua-async-await" },
			{ "nvim-java/nvim-java-core" },
			{ "nvim-java/nvim-java-test" },
			{ "nvim-java/nvim-java-dap" },
			{ "nvim-java/nvim-java-refactor" },
			{ "MunifTanjim/nui.nvim" },
		},
	})

	-- Java Debugging (DAP)
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
	})

	-- Advanced Java Testing with Neotest
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"rcasia/neotest-java",
		},
	})

	-- Spring Boot Project Generator
	-- DISABLED (2026-07-06): The `javiorfo` GitHub account was deleted (404) -
	-- nvim-springtime, nvim-popcorn, and nvim-spinetta can no longer be cloned.
	-- Keeping the spec commented so PackerSync stays deterministic on fresh
	-- machines. Re-enable only if the plugin resurfaces under a new owner/fork.
	--[[
	use({
		"javiorfo/nvim-springtime",
		requires = {
			"javiorfo/nvim-popcorn",
			"javiorfo/nvim-spinetta",
			"hrsh7th/nvim-cmp",
		},
	})
	--]]

	-- Blazing fast TypeScript Engine
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	use("nvim-tree/nvim-tree.lua")
	use("numToStr/Comment.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Modern Discord Presence with VSCODE Icons
	--[[
	use({
		"vyfor/cord.nvim",
		run = ":Cord update",
		-- config = function()
		-- 	require("after.plugin.rpcDope")
		-- end,
	})
  ]]
	use("IogaMaster/neocord")
	-- use("andweeb/presence.nvim")

	-- use({ "derektata/lorem.nvim" })
	--[[ use({
		"derektata/lorem.nvim",
		config = function()
			require("lorem").setup({
				sentenceLength = "mixed",
				comma_chance = 0.3,
				max_commas_per_sentence = 2,
			})
		end,
	}) ]]

	--[[
	-- Image Preview
  -- Install Chafa in your machine for it to work inside nvim 
  -- $ git clone https://github.com/hpjansson/chafa.git
  -- $ cd chafa
  -- $ ./autogen.sh
  -- $ make
  -- $ sudo make install
  --]]
	use({
		"princejoogie/chafa.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
	})

	-- Augment
	use({
		"augmentcode/augment.vim",
		--[[ config = function()
			-- Load our dedicated Augment configuration
			require("after.plugin.augment")
		end, ]]
	})

	-- Copilot
	use({
		"github/copilot.vim",
		--[[ config = function()
			require("after.plugin.copilot")
		end, ]]
	})

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Indent line
	use({
		"Yggdroot/indentLine",
	})

	-- @ Dashboard (Start Screen) - nvimdev/dashboard-nvim
	-- Ships BOTH layouts: `doom` (default here) and `hyper`.
	-- Runtime switch: :DashboardDoom / :DashboardHyper / :DashboardToggleTheme
	-- Configuration lives in after/plugin/dashboard.lua (per repo convention)
	use({
		"nvimdev/dashboard-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = { "markdown" }, -- lazy-load on markdown files
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	})

	-- /* IDE Theme (Enable Only One) : THREE Themes at the Moment! */

	-- @ Github Themes
	--[[ 	use({ "projekt0n/github-nvim-theme" }) ]]

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
	use({
		"folke/tokyonight.nvim",
		as = "tokyonight",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	})

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
  ]]

	-- @ Moonfly Theme
	--[[
	use({
		"bluz71/vim-moonfly-colors",
		config = function()
			require("after.plugin.moonfly-theme")
		end,
	})
  ]]

	-- @ Nord
	--[[
	use({
		"shaunsingh/nord.nvim",
		config = function()
			require("after.plugin.nord-theme")
		end,
	})
  ]]

	-- @ One Dark Pro theme
	--[[
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("after.plugin.onedark-theme")
		end,
	})
  ]]
	--
end)
