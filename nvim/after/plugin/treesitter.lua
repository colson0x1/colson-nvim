local status, nvim_treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_treesitter_config.setup({

	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"json",
		"css",
		"dockerfile",
		"go",
		"graphql",
		"html",
		"markdown",
		"gitignore",
		"prisma",
		"scss",
		"sql",
		"yaml",
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	indent = { enable = true },

	autotag = { enable = true },

	-- Rainbow Parenthesis
	--[[
	rainbow = {
		enable = true,
		-- list of languages you want to disable the plugin for
		disable = {},
		-- Which query to use for finding delimiters
		query = "rainbow-parens",
		-- Highlight the entire buffer all at once
		strategy = require("ts-rainbow").strategy.global,
	},
  --]]
})
