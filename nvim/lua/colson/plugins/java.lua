-- ============================================================================
-- Plugins / Java - enterprise-grade Java development (LSP, DAP, testing)
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- ============================================================================

return {
	-- Java Development - Enterprise Grade Setup
	-- FIXED (2026-07-06): modern nvim-java (4.x) BUNDLES java-core, java-test,
	-- java-dap, java-refactor, and the async lib inside its own lua/ tree.
	-- The old standalone repos are stale (e.g. nvim-java-refactor 1.8.0
	-- exports nothing) and SHADOW the bundled modules on the runtimepath,
	-- crashing java.setup() with "attempt to index a boolean value".
	-- Dependency list now matches upstream's official spec exactly.
	{
		"nvim-java/nvim-java",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			{ "MunifTanjim/nui.nvim" },
			{ "mfussenegger/nvim-dap" },
			-- Spring Boot LS integration, commit-pinned by upstream nvim-java
			{ "JavaHello/spring-boot.nvim", commit = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0" },
			-- Legacy standalone components - now bundled inside nvim-java.
			-- Kept for reference; DO NOT re-enable (they shadow bundled code):
			-- { "nvim-java/lua-async-await" },
			-- { "nvim-java/nvim-java-core" },
			-- { "nvim-java/nvim-java-test" },
			-- { "nvim-java/nvim-java-dap" },
			-- { "nvim-java/nvim-java-refactor" },
		},
	},

	-- Java Debugging (DAP)
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
	},

	-- Advanced Java Testing with Neotest
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"rcasia/neotest-java",
		},
	},

	-- Spring Boot Project Generator
	-- DISABLED (2026-07-06): The `javiorfo` GitHub account was deleted (404) -
	-- nvim-springtime, nvim-popcorn, and nvim-spinetta can no longer be cloned.
	-- Keeping the spec commented so installs stay deterministic on fresh
	-- machines. Re-enable only if the plugin resurfaces under a new owner/fork.
	--[[
	{
		"javiorfo/nvim-springtime",
		dependencies = {
			"javiorfo/nvim-popcorn",
			"javiorfo/nvim-spinetta",
			"hrsh7th/nvim-cmp",
		},
	},
	--]]
}
