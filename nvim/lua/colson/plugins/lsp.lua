-- ============================================================================
-- Plugins / LSP - language servers, completion, treesitter, formatting
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- ============================================================================

return {
	-- Formatting and Linting - FIXED for 0.11.x (null-ls archived, using none-ls)
	{ "nvimtools/none-ls.nvim" }, -- Maintained fork of null-ls
	{ "jay-babu/mason-null-ls.nvim" },

	-- MIGRATED to `main` (2026-07-06): the frozen `master` branch explicitly
	-- does NOT support Neovim 0.12 (its README states 0.10/0.11 only) and
	-- crashed Telescope previews / injections on 0.12. `main` is the
	-- supported rewrite; after/plugin/treesitter.lua uses its new API.
	-- (The original Packer spec passed `run = ":TSUpdate"` as a second
	-- argument, which Packer ignored - lazy.nvim's `build` does it properly.)
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- DISABLED (2026-07-06): playground targets the old master branch only.
	-- Neovim 0.12 ships the same functionality natively: :InspectTree,
	-- :EditQuery, and :Inspect.
	-- { "nvim-treesitter/playground" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
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
	},

	-- Blazing fast TypeScript Engine
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},

	-- LSP progress UI (ADDED 2026-07-06)
	-- Unobtrusive bottom-right spinner showing language-server indexing
	-- progress - invaluable on large codebases where tsserver/jdtls/gopls
	-- take a while to warm up. Config: after/plugin/fidget.lua
	{ "j-hui/fidget.nvim" },
}
