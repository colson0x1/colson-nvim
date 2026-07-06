-- ============================================================================
-- Plugins / UI - dashboard, statusline, file tree, icons, themes
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- ============================================================================

return {
	-- @ Dashboard (Start Screen) - nvimdev/dashboard-nvim
	-- Ships BOTH layouts: `doom` (default here) and `hyper`.
	-- Runtime switch: :DashboardDoom / :DashboardHyper / :DashboardToggleTheme
	-- Configuration lives in after/plugin/dashboard.lua (per repo convention)
	{
		"nvimdev/dashboard-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ "nvim-tree/nvim-tree.lua" },

	-- NOTE: was `kyazdani42/nvim-web-devicons` under Packer; that URL is a
	-- GitHub redirect to nvim-tree/nvim-web-devicons. Normalized here so
	-- lazy.nvim sees a single canonical source for the plugin.
	{ "nvim-tree/nvim-web-devicons" },

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Tabs Bufferline
	-- Uncomment to Enable Tab based File Buffer
	--[[
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
  --]]

	-- /* IDE Theme (Enable Only One) : THREE Themes at the Moment! */

	-- @ Github Themes
	--[[ { "projekt0n/github-nvim-theme" }, ]]

	-- @ JetBrains IDE Theme
	--[[
	{
		"doums/darcula",
		name = "darcula",
		config = function()
			vim.cmd("colorscheme darcula")
		end,
	},
  --]]

	-- @ Tokyo Night Theme
	-- (was `as = "tokyonight"` under Packer; lazy.nvim uses the canonical
	-- repo name. priority=1000 loads the colorscheme before other plugins.)
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},

	-- @ Catppuccin Theme
	--[[
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
	},
  --]]

	-- @ Rose Pine Theme
	--[[
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
  ]]

	-- @ Moonfly Theme
	--[[
	{
		"bluz71/vim-moonfly-colors",
		config = function()
			require("after.plugin.moonfly-theme")
		end,
	},
  ]]

	-- @ Nord
	--[[
	{
		"shaunsingh/nord.nvim",
		config = function()
			require("after.plugin.nord-theme")
		end,
	},
  ]]

	-- @ One Dark Pro theme
	--[[
	{
		"navarasu/onedark.nvim",
		config = function()
			require("after.plugin.onedark-theme")
		end,
	},
  ]]
	--
}
