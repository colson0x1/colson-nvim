-- Nord Theme Configuration for Neovim
-- Optimized for long coding sessions, clarity, and professional design.

-- Failsafe plugin loading
local status_ok, nord = pcall(require, "nord")
if not status_ok then
	return
end

-- Set global theme options for a world-class developer experience
vim.g.nord_contrast = true -- Ensures high contrast for readability
vim.g.nord_borders = true -- Add borders to UI elements for structure
vim.g.nord_disable_background = false -- Keep Nord's background intact for consistent design
vim.g.nord_cursorline_transparent = false -- Ensures visibility of cursor line
vim.g.nord_enable_sidebar_background = true -- Sidebar background consistent with main content
vim.g.nord_italic = true -- Use italics for modern and distinguishable elements
vim.g.nord_uniform_diff_background = true -- Uniform background color in diff views
vim.g.nord_bold = true -- Use bold for important syntax elements (e.g., keywords)

-- Apply Nord theme
nord.set()

-- Custom highlights for a more tailored look
vim.cmd([[
  " Background and foreground for Normal text
  highlight Normal guibg=#2E3440 guifg=#D8DEE9

  " Enhanced Comments (italicized)
  highlight Comment guifg=#4C566A gui=italic

  " Identifiers like variables, functions, and classes (bold and cyan)
  highlight Identifier guifg=#88C0D0 gui=bold

  " Statements (keywords and flow control)
  highlight Statement guifg=#81A1C1 gui=bold

  " Preprocessor directives
  highlight PreProc guifg=#5E81AC gui=bold

  " Types (class names, structs, etc.)
  highlight Type guifg=#8FBCBB gui=bold

  " Function names
  highlight Function guifg=#88C0D0 gui=bold

  " Keywords like if, for, while, etc.
  highlight Keyword guifg=#81A1C1 gui=bold

  " Strings (text, messages, file paths)
  highlight String guifg=#A3BE8C

  " Numbers (decimal and hex values)
  highlight Number guifg=#B48EAD

  " Constants (constant values, enums)
  highlight Constant guifg=#D08770

  " Operators (addition, subtraction, etc.)
  highlight Operator guifg=#ECEFF4

  " Error messages
  highlight Error guifg=#BF616A gui=bold

  " Warnings
  highlight Warning guifg=#EBCB8B

  " Todo comments and markers
  highlight Todo guifg=#EBCB8B gui=bold,italic

  -- Diff highlights (Add, Delete, Change)
  highlight DiffAdd guibg=#A3BE8C guifg=#2E3440
  highlight DiffDelete guibg=#BF616A guifg=#2E3440
  highlight DiffChange guibg=#5E81AC guifg=#2E3440
  highlight DiffText guibg=#81A1C1 guifg=#2E3440 gui=bold

  -- Line numbers and current line number
  highlight LineNr guifg=#4C566A
  highlight CursorLineNr guifg=#ECEFF4 gui=bold

  -- Popup menu (e.g., completion menu)
  highlight Pmenu guibg=#3B4252 guifg=#D8DEE9
  highlight PmenuSel guibg=#4C566A guifg=#D8DEE9 gui=bold

  -- Status line highlighting
  highlight StatusLine guibg=#3B4252 guifg=#D8DEE9
  highlight StatusLineNC guibg=#2E3440 guifg=#4C566A

  -- Search and match highlighting
  highlight Visual guibg=#434C5E
  highlight Search guibg=#EBCB8B guifg=#2E3440 gui=bold
  highlight IncSearch guibg=#88C0D0 guifg=#2E3440 gui=bold
  highlight MatchParen guibg=#434C5E guifg=#ECEFF4 gui=bold
]])

-- Terminal-specific adjustments for Nord colors
if vim.fn.exists("g:neovide") == 0 then
	vim.cmd([[ highlight Normal guibg=NONE ctermbg=NONE ]])
end

-- Integrating with Lualine for a sleek, consistent status line
require("lualine").setup({
	options = {
		theme = "nord",
		section_separators = { "", "" },
		component_separators = { "", "" },
		icons_enabled = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "fugitive", "nvim-tree" },
})

-- Highlighting for Telescope (optional)
vim.cmd([[
  highlight TelescopeBorder guifg=#4C566A
  highlight TelescopePromptNormal guibg=#2E3440
  highlight TelescopePromptBorder guifg=#4C566A
  highlight TelescopeResultsNormal guibg=#2E3440
  highlight TelescopeResultsBorder guifg=#4C566A
  highlight TelescopePreviewNormal guibg=#2E3440
  highlight TelescopePreviewBorder guifg=#4C566A
]])

-- Set transparent background if running inside a terminal with Nord-compatible colors
if vim.fn.has("gui_running") == 1 then
	vim.cmd([[ highlight Normal guibg=NONE ctermbg=NONE ]])
end
