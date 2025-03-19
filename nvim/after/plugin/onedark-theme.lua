-- OneDark Theme Configuration for Neovim
-- Optimized for long coding sessions, clarity, and professional design/experience.
local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

onedark.setup({
	style = "deep", -- Available: dark, darker, cool, deep, warm, warmer
	transparent = false, -- Keep background (true for transparency)
	term_colors = true, -- Set terminal colors
	ending_tildes = false, -- Hide end-of-buffer tildes
	cmp_itemkind_reverse = false, -- Use standard ordering for completion menu

	-- 🔹 Code Style
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "bold",
		strings = "NONE",
		variables = "NONE",
	},

	-- 🔹 Advanced UI Tweaks
	diagnostics = {
		darker = true, -- Darker background for diagnostics
		undercurl = true, -- Enable undercurl for diagnostics
		background = true, -- Virtual text background
	},

	-- 🔹 Plugin Integrations
	plugins = {
		nvim_tree = { enable = true, background = false }, -- NvimTree support
		telescope = { enable = true }, -- Telescope support
		treesitter = true, -- Treesitter support
		cmp = true, -- Completion plugin support
		lualine = { enable = true }, -- Lualine support
	},

	-- 🔹 Custom Highlights (World-class readability)
	highlights = {
		Normal = { bg = "#282C34", fg = "#D8DEE9" },
		Comment = { fg = "#5C6370", gui = "italic" },
		Keyword = { fg = "#C678DD", gui = "bold" },
		Function = { fg = "#61AFEF", gui = "bold" },
		String = { fg = "#98C379" },
		Number = { fg = "#D19A66" },
		Variable = { fg = "#E5C07B" },
		Constant = { fg = "#56B6C2" },
		Error = { fg = "#E06C75", gui = "bold" },
		Visual = { bg = "#3E4451" },
		Search = { fg = "#EBCB8B", bg = "#2E3440" },
		MatchParen = { fg = "#61AFEF", bg = "#2E3440" },
		LineNr = { fg = "#3E4451" },
		StatusLine = { bg = "#2C323C", fg = "#D8DEE9" },
		StatusLineNC = { bg = "#1C2025", fg = "#4B5263" },
		Pmenu = { bg = "#3E4451", fg = "#D8DEE9" },
		PmenuSel = { bg = "#61AFEF", fg = "#282C34" },
		TabLine = { bg = "#2C323C", fg = "#D8DEE9" },
		TabLineSel = { bg = "#61AFEF", fg = "#282C34" },
		DiffAdd = { bg = "#3A3F4B", fg = "#98C379" },
		DiffDelete = { bg = "#3A3F4B", fg = "#E06C75" },
		DiffChange = { bg = "#3A3F4B", fg = "#D19A66" },
	},
})

-- Apply theme safely
local apply_status, err = pcall(onedark.load)
if not apply_status then
	vim.notify("❌ Failed to apply OneDark.nvim: " .. err, vim.log.levels.ERROR)
end

-- 🌟 Enhance Neovim Diagnostics UI
vim.diagnostic.config({
	virtual_text = {
		severity = { min = vim.diagnostic.severity.INFO },
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
	},
	signs = true,
})

-- 🚀 Statusline (Lualine) Configuration
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
	lualine.setup({
		options = {
			theme = "onedark",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
		},
	})
end

vim.cmd("colorscheme onedark") -- Ensure One Dark Pro is applied
