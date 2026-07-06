-- ============================================================================
-- Plugins / Editor - navigation, search, editing ergonomics
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- All original comments preserved. Commented specs are translated to lazy
-- syntax so re-enabling them is a pure uncomment.
-- ============================================================================

return {
	-- Telescope - UPDATED for 0.11.x compatibility
	{
		"nvim-telescope/telescope.nvim",
		branch = "master", -- Use latest instead of old 0.1.4
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Native fzf sorter for Telescope (ADDED 2026-07-06)
	-- after/plugin/telescope.lua already declares the `fzf` extension and
	-- loads it silently when present - this plugin activates that path.
	-- Orders-of-magnitude faster fuzzy matching on large monorepos.
	-- Build requires make + a C compiler (present on any dev box; on macOS
	-- via xcode-select --install).
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	{ "christoomey/vim-tmux-navigator" },
	{ "leafOfTree/vim-matchtag" },
	-- Displays color code
	{ "norcalli/nvim-colorizer.lua" },

	-- Rainbow Parenthesis
	-- { "HiPhish/nvim-ts-rainbow2" },

	-- Auto Save
	{ "0x00-ketsu/autosave.nvim" },

	-- For enhanced quickfix handling @ nvim-pqf
	{
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
	},

	{ "nikvdp/ejs-syntax" },

	-- @ React Snippets
	--[[
	{
		"epilande/vim-react-snippets",
		dependencies = {
			"epilande/vim-es2015-snippets",
			"SirVer/ultisnips",
		},
		-- fs = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	--]]

	{
		"mlaursen/vim-react-snippets",
		dependencies = {
			"SirVer/ultisnips",
		},
		-- NOTE: the original Packer spec used `fs = {...}` (a typo for `ft`),
		-- which Packer silently ignored - the plugin always eager-loaded.
		-- Kept eager here to preserve identical behavior:
		-- fs = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},

	{ "windwp/nvim-autopairs" },
	-- { "windwp/nvim-ts-autotag" },

	{ "nvim-lua/plenary.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },

	{ "mattn/emmet-vim" },

	-- JSX/TSX Comment
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	{ "numToStr/Comment.nvim" },

	-- Indent line
	{ "Yggdroot/indentLine" },
}
