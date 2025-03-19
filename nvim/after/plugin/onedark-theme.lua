-- OneDark Theme Configuration for Neovim
local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	return
end

-- Force the correct background color
local bg_color = "#282c34" -- Standard OneDark background
local darker_bg = "#21252b" -- Slightly darker for contrast elements

onedark.setup({
	-- Core theme settings
	-- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	style = "deep", -- Changed from "deep" which might be causing the dark navy issue
	transparent = false, -- Ensure solid background
	term_colors = true,
	ending_tildes = false,
	cmp_itemkind_reverse = false,

	-- Code style configuration
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "bold",
		strings = "NONE",
		variables = "NONE",
	},

	-- Diagnostics appearance
	diagnostics = {
		darker = true,
		undercurl = true,
		background = true,
	},

	-- Plugin integrations
	plugins = {
		nvim_tree = { enable = true, background = false },
		telescope = { enable = true },
		treesitter = true,
		cmp = true,
		lualine = { enable = true },
	},

	-- Comprehensive highlight overrides
	highlights = {
		-- Core editor elements
		Normal = { bg = bg_color, fg = "#abb2bf" },
		NormalNC = { bg = bg_color }, -- Non-current windows
		NormalFloat = { bg = bg_color },
		LineNr = { fg = "#495162" },
		SignColumn = { bg = bg_color },
		EndOfBuffer = { bg = bg_color },
		VertSplit = { fg = darker_bg, bg = bg_color },

		-- Syntax highlighting
		Comment = { fg = "#5c6370", italic = true },
		Keyword = { fg = "#c678dd", bold = true },
		Function = { fg = "#61afef", bold = true },
		String = { fg = "#98c379" },
		Number = { fg = "#d19a66" },
		Variable = { fg = "#e5c07b" },
		Constant = { fg = "#56b6c2" },
		Error = { fg = "#e06c75", bold = true },

		-- Search and selection
		Visual = { bg = "#3e4452" },
		Search = { fg = "#e5c07b", bg = "#3e4452" },
		IncSearch = { fg = bg_color, bg = "#e5c07b" },

		-- UI elements
		Pmenu = { bg = "#3e4452", fg = "#abb2bf" },
		PmenuSel = { bg = "#61afef", fg = bg_color },
		StatusLine = { bg = "#2c323c", fg = "#abb2bf" },
		StatusLineNC = { bg = darker_bg, fg = "#5c6370" },

		-- Critical: Fix Netrw colors
		Directory = { fg = "#61afef" },
		netrwDir = { fg = "#61afef" },
		netrwClassify = { fg = "#e5c07b" },
		netrwPlain = { fg = "#abb2bf" },
		netrwSymLink = { fg = "#c678dd" },
		netrwExe = { fg = "#98c379" },
		netrwComment = { fg = "#5c6370", italic = true },
		netrwList = { fg = "#61afef" },
		netrwHelpCmd = { fg = "#56b6c2" },
		netrwCmdSep = { fg = "#5c6370" },
		netrwVersion = { fg = "#98c379" },

		-- Buffer/Tab line
		TabLine = { bg = "#2c323c", fg = "#abb2bf" },
		TabLineSel = { bg = "#61afef", fg = bg_color },
		TabLineFill = { bg = darker_bg },

		-- Diffs
		DiffAdd = { bg = "#3d4853", fg = "#98c379" },
		DiffChange = { bg = "#3d4853", fg = "#d19a66" },
		DiffDelete = { bg = "#3d4853", fg = "#e06c75" },

		-- Git decoration
		GitSignsAdd = { fg = "#98c379" },
		GitSignsChange = { fg = "#d19a66" },
		GitSignsDelete = { fg = "#e06c75" },

		-- Diagnostics
		DiagnosticError = { fg = "#e06c75" },
		DiagnosticWarn = { fg = "#d19a66" },
		DiagnosticInfo = { fg = "#61afef" },
		DiagnosticHint = { fg = "#56b6c2" },

		-- NvimTree elements
		NvimTreeNormal = { bg = bg_color },
		NvimTreeEndOfBuffer = { bg = bg_color },
		NvimTreeRootFolder = { fg = "#e5c07b", bold = true },
		NvimTreeFolderIcon = { fg = "#61afef" },
		NvimTreeIndentMarker = { fg = "#495162" },
		NvimTreeOpenedFolderName = { fg = "#61afef" },
	},
})

-- Apply the theme safely
local apply_status, err = pcall(onedark.load)
if not apply_status then
	vim.notify("Failed to apply OneDark: " .. err, vim.log.levels.ERROR)
end

-- Configure diagnostics
vim.diagnostic.config({
	virtual_text = { severity = { min = vim.diagnostic.severity.INFO } },
	float = { focusable = false, style = "minimal", border = "rounded" },
	signs = true,
})

-- Set up lualine with original style
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
	lualine.setup({
		options = {
			theme = "onedark",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			icons_enabled = true,
		},
	})
end

-- Force colorscheme to be reapplied
vim.cmd([[
	colorscheme onedark
	
	" Force background color to be consistent
	hi Normal guibg=#282c34
	hi NormalFloat guibg=#282c34
	hi NvimTreeNormal guibg=#282c34
	hi SignColumn guibg=#282c34
	
	" Fix Netrw colors explicitly
	hi Directory guifg=#61afef
	hi netrwDir guifg=#61afef
]])
