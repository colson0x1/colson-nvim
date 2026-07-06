-- ============================================================================
-- @ Treesitter - Enterprise-Grade Configuration (main branch API)
-- Author: Colson (@colson0x1)
--
-- MIGRATED (2026-07-06): nvim-treesitter `master` (the old
-- require("nvim-treesitter.configs") module system) explicitly does NOT
-- support Neovim 0.12 - it crashed Telescope previews and injection parsing
-- ("attempt to call method 'range'"). The `main` branch is the supported,
-- actively maintained rewrite: parsers are installed with
-- require("nvim-treesitter").install() and highlighting/indentation use
-- Neovim's native vim.treesitter APIs per buffer.
-- The previous master-branch config is preserved at the bottom of this file.
-- ============================================================================

local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
	return
end

-- A list of parser names (mirrors the old `ensure_installed`)
-- markdown_inline added: markdown injections require it (its absence broke
-- Telescope's markdown previews).
local ensure_installed = {
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
	"markdown_inline",
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
}

-- Async and idempotent: already-installed parsers are skipped instantly.
treesitter.install(ensure_installed)

-- Native highlight + treesitter indentation per buffer.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("colson-treesitter", { clear = true }),
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang then
			return
		end

		if pcall(vim.treesitter.start, ev.buf, lang) then
			-- Treesitter-based indentation (main-branch replacement for the
			-- old `indent = { enable = true }` module)
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		else
			-- Mirrors the old `auto_install = true`: fetch missing parsers in
			-- the background; highlighting activates on the next buffer load.
			-- Guarded against plugin-private filetypes (dashboard, packer,
			-- NvimTree, ...) which have no parser in the registry and would
			-- otherwise print an "unsupported language" warning on screen.
			pcall(function()
				if vim.tbl_contains(treesitter.get_available(), lang) then
					treesitter.install(lang)
				end
			end)
		end
	end,
})

-- ============================================================================
-- LEGACY master-branch configuration (pre-2026-07-06) - kept for reference.
-- Do NOT re-enable on Neovim 0.12+: require("nvim-treesitter.configs") only
-- exists on the unsupported master branch.
-- ============================================================================
--[==[
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
--]==]
