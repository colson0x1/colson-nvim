-- @ v2
-- Failsafe plugin loading
local status, moonfly = pcall(require, "moonfly")
if not status then
	return
end

-- Enable true colors for an optimal display.
vim.o.termguicolors = true

-- Set Moonfly global options for a sophisticated appearance.
vim.g.moonflyTransparent = true -- Use a transparent background.
vim.g.moonflyBoldVerticalSplitLine = 1 -- Emphasize vertical splits.
vim.g.moonflyItalic = 1 -- Enable italics in relevant highlights.

-- Define a helper function to safely load the colorscheme.
local function safe_load_colorscheme()
	local status_ok, _ = pcall(function()
		vim.cmd("colorscheme moonfly")
	end)
	if not status_ok then
		vim.notify("Moonfly colorscheme not found or failed to load!", vim.log.levels.ERROR)
		return false
	end
	return true
end

if safe_load_colorscheme() then
	-- Additional customizations for a polished, professional look:

	-- Make the Normal background transparent.
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

	-- Refine line number display.
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#5f5f5f" })

	-- Highlight the current line with a subtle yet clear background.
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e2e2e" })

	-- Enhance Visual mode selection for improved focus.
	vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3a3a" })

	-- Customize comment style for readability—soft green with italics.
	vim.api.nvim_set_hl(0, "Comment", { fg = "#6a9955", italic = true })

	-- Optional: Further customizations can be added here.
	-- For example, adjusting StatusLine, TabLine, or plugin-specific highlights:
	-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1e222a", fg = "#c0caf5", bold = true })

	vim.notify("Moonfly theme loaded successfully with elite customizations!", vim.log.levels.INFO)
end

--[[
-- @ v1
-- Enable true color support for an enhanced visual experience.
vim.o.termguicolors = true

-- Tokyonight Global Settings:
-- Choose your style variant: "night", "storm", or "day".
vim.g.tokyonight_style = "storm"
-- Optionally, set the background to be transparent.
vim.g.tokyonight_transparent = true
-- Optional: Enable italics for comments and keywords.
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true

-- Safely load the colorscheme using pcall to avoid errors if it isn't found.
local status_ok, _ = pcall(function()
	vim.cmd("colorscheme tokyonight")
end)
if not status_ok then
	vim.notify("Tokyonight colorscheme not found or failed to load!", vim.log.levels.ERROR)
	return
end

-- Additional Highlight Customizations:
-- Make the Normal background transparent.
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- Customize line numbers.
vim.api.nvim_set_hl(0, "LineNr", { fg = "#565f89" })
-- Highlight the current line for improved cursor visibility.
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2e3440" })
-- Customize visual selection highlight.
vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3f5a" })
-- Further tweak comments for readability.
vim.api.nvim_set_hl(0, "Comment", { fg = "#7f848e", italic = true })

-- Final Notification to Confirm Successful Load
vim.notify("Tokyonight theme loaded successfully", vim.log.levels.INFO) 
]]
