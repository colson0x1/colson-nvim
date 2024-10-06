local status, git_merge_conflict = pcall(require, "git-conflict")
if not status then
	return
end

git_merge_conflict.setup({
	default_mappings = true, -- Enable default keybindings for conflict management
	disable_diagnostics = false, -- Keep diagnostics enabled during conflict resolution
	highlights = { -- Customize highlight groups for conflicts
		incoming = "DiffAdd", -- Highlight incoming changes with DiffAdd
		current = "DiffText", -- Highlight current changes with DiffText
	},
	diff_algorithm = "patience", -- Use a more advanced diff algorithm
	signs = { -- Configure gutter signs for conflict markers
		incoming = ">>>>>>", -- Sign for incoming changes
		current = "======", -- Sign for current changes
		ancestor = "||||||", -- Sign for ancestor changes (in 3-way merge)
	},
	statusline_text = { -- Customize text to show in the status line during conflict
		current = "HEAD",
		incoming = "INCOMING",
		ancestor = "ANCESTOR",
	},
	auto_refresh = true, -- Automatically refresh the buffer when conflicts are detected
	default_command = "merge", -- Default conflict resolution command
})
