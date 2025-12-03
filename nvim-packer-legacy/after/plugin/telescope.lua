--[[
local status, builtin = pcall(require, "telescope.builtin")
if not status then
	return
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
]]

-- @ Telescope
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

telescope.setup({
	defaults = {
		-- Basic appearance
		prompt_prefix = "> ",
		selection_caret = "> ",

		-- Layout configuration
		layout_config = {
			horizontal = {
				width = 0.8,
				height = 0.8,
				preview_width = 0.5,
			},
		},

		-- File ignore patterns
		file_ignore_patterns = { "node_modules", ".git", "target", "build" },

		-- Basic mappings
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
			},
		},
	},

	pickers = {
		find_files = { hidden = true },
		live_grep = {
			additional_args = function()
				return { "--hidden" }
			end,
		},
		lsp_document_symbols = { theme = "dropdown" },
		lsp_workspace_symbols = { theme = "dropdown" },
		diagnostics = { theme = "dropdown" },
	},

	extensions = {
		fzf = {
			fuzzy = true, -- Enable fuzzy search
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

-- Load Telescope extensions
pcall(telescope.load_extension, "fzf")

-- Keymaps for Telescope with <leader> prefix
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Core functionality
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Search in files" })
keymap("n", "<leader>ps", builtin.live_grep, { desc = "Search in files" })
keymap("n", "<leader>fb", builtin.buffers, { desc = "Switch buffers" })
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
keymap("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search string" })

-- Advanced features for software engineers
keymap("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
keymap("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
keymap("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
keymap("n", "<leader>fi", builtin.lsp_implementations, { desc = "Find implementations" })
keymap("n", "<leader>fc", builtin.commands, { desc = "Run commands" })
keymap("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter symbols" })

-- Git integrations
keymap("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
keymap("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
keymap("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
keymap("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
