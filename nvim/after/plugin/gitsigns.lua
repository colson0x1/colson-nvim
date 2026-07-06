-- ============================================================================
-- @ Gitsigns - line-level git change indicators (Enterprise-Grade)
-- Author: Colson (@colson0x1)
-- Description: Hunk signs in the gutter + optional inline blame.
--              Deliberately configured WITHOUT keymaps so no existing
--              binding (<leader>gs = Telescope git_status, etc.) changes.
--              Use :Gitsigns <subcommand> for hunk operations.
-- ============================================================================

-- Safe loading with proper error handling
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- gutter signs on (matches vim.opt.signcolumn = "yes")
	current_line_blame = false, -- toggle with :Gitsigns toggle_current_line_blame
	current_line_blame_opts = {
		delay = 500,
		virt_text_pos = "eol",
	},
	preview_config = {
		border = "rounded",
	},
	-- Large-repo safety: skip files where git operations would be slow
	max_file_length = 40000,
})
