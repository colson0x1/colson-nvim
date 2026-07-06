-- ============================================================================
-- Plugins / Git - diff, merge, history tooling
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- ============================================================================

return {
	-- Git Diff
	{ "sindrets/diffview.nvim" },

	-- Git Merge
	{
		"akinsho/git-conflict.nvim",
		version = "*", -- was `tag = "*"` under Packer
		--[[ config = function()
			require("git-merge-conflict")
		end, ]]
	},

	-- Git Rebase Diff
	{
		"yutkat/git-rebase-auto-diff.nvim",
		ft = { "gitrebase" },
		config = function()
			require("git-rebase-auto-diff").setup()
		end,
	},

	{ "tpope/vim-fugitive" },

	-- Git hunk signs in the gutter (ADDED 2026-07-06)
	-- Complements fugitive/diffview with line-level change indicators,
	-- essential when navigating large diffs in big repositories.
	-- Config: after/plugin/gitsigns.lua (no keymaps - zero conflicts).
	{ "lewis6991/gitsigns.nvim" },
}
