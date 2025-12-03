--[[
  Augment Code configuration for large enterprise microservices applications.
  This file configures the Augment plugin with:
    • Explicit workspace folder detection and auto-updating.
    • Custom key mappings for inline suggestions, chat commands, and enterprise workflows.
    • Additional user command aliases for quick invocation of Augment’s functions.
  
  The goal is to provide the AI engine with full context of my codebase so that completions
  and chat suggestions are highly accurate—essential for engineers.
  
  We can set the environment variable ENTERPRISE_WORKSPACES to a colon-separated list of
  paths (e.g. "/path/one:/path/two") to define our workspaces; otherwise, it 
  defaults to the current directory.
]]
--

----------------------------------------
-- Helper: Retrieve Workspace Folders --
----------------------------------------
local function get_workspace_folders()
	local workspaces = {}
	local env_paths = os.getenv("ENTERPRISE_WORKSPACES")
	if env_paths and env_paths ~= "" then
		-- Split the colon-separated string into individual paths
		for path in string.gmatch(env_paths, "([^:]+)") do
			table.insert(workspaces, path)
		end
	else
		-- Default: use the current working directory
		table.insert(workspaces, vim.fn.getcwd())
	end
	return workspaces
end

---------------------------------------------------
-- Set Augment Workspace Folders for Code Context --
---------------------------------------------------
vim.g.augment_workspace_folders = get_workspace_folders()

-- Auto-update the workspace folders when we change directory.
-- This is especially useful in an enterprise environment where we might be moving between microservice directories.
vim.cmd([[
  augroup AugmentWorkspace
    autocmd!
    autocmd DirChanged * lua require("after.plugins.augmentcode").update_workspace()
  augroup END
]])

--------------------------------------------
-- Function: Update Workspace on Directory Change --
--------------------------------------------
local M = {}
function M.update_workspace()
	local new_workspace = vim.fn.getcwd()
	local exists = false
	for _, path in ipairs(vim.g.augment_workspace_folders) do
		if path == new_workspace then
			exists = true
			break
		end
	end
	if not exists then
		table.insert(vim.g.augment_workspace_folders, new_workspace)
		print("Augment: Added new workspace folder: " .. new_workspace)
	end
end

--------------------------------------------------
-- Disable Default Tab Mapping for Augment.vim --
--------------------------------------------------
-- We disable the default Tab mapping to avoid conflicts and allow custom keybindings.
vim.g.augment_disable_tab_mapping = true

----------------------------------------
-- Define Key Mapping Options --
----------------------------------------
local opts = { noremap = true, silent = true }

--------------------------------------------------
-- Insert Mode Mappings for Accepting Suggestions --
--------------------------------------------------
-- <C-y> is mapped to accept a suggestion.
vim.api.nvim_set_keymap(
	"i",
	"<C-y>",
	"<cmd>call augment#Accept()<cr>",
	vim.tbl_extend("force", opts, { desc = "Augment: Accept suggestion" })
)
-- Optionally, map Enter (<CR>) to accept a suggestion with a newline fallback.
vim.api.nvim_set_keymap(
	"i",
	"<CR>",
	'<cmd>call augment#Accept("\n")<cr>',
	vim.tbl_extend("force", opts, { desc = "Augment: Accept suggestion or insert newline" })
)

---------------------------------------------------
-- Normal Mode Mappings for Augment Commands --
---------------------------------------------------
-- These mappings use <leader> + a short alias to invoke various Augment commands.
vim.api.nvim_set_keymap(
	"n",
	"<leader>as",
	":Augment status<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Show status" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>asi",
	":Augment signin<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Sign in" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ao",
	":Augment signout<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Sign out" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ae",
	":Augment enable<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Enable suggestions" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ad",
	":Augment disable<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Disable suggestions" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>al",
	":Augment log<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Show log" })
)

---------------------------------------------------
-- Chat Commands for Multi-Turn Conversations --
---------------------------------------------------
vim.api.nvim_set_keymap(
	"n",
	"<leader>ac",
	":Augment chat<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Start chat" })
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>ac",
	":Augment chat<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Chat with selection" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>an",
	":Augment chat-new<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: New chat conversation" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>at",
	":Augment chat-toggle<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Toggle chat panel" })
)

---------------------------------------------------
-- Additional Enterprise-Grade Aliases --
---------------------------------------------------
-- These commands offer quick actions for code review and refactoring suggestions.
vim.api.nvim_set_keymap(
	"n",
	"<leader>acp",
	":Augment chat Please review the current function for potential improvements.<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: AI Code Review" })
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>acf",
	":Augment chat Suggest refactoring for this block of code.<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: AI Refactoring Suggestions" })
)

-- Visual mode mapping: send the selected text to Augment chat.
vim.api.nvim_set_keymap(
	"v",
	"<leader>aq",
	":Augment chat<CR>",
	vim.tbl_extend("force", opts, { desc = "Augment: Chat with selection" })
)

---------------------------------------------------
-- User Command Aliases for Even Quicker Access --
---------------------------------------------------
-- Create short, global command aliases for Augment commands.
-- These allow we to type, for example, :AChat instead of :Augment chat.
vim.cmd([[ command! AStatus   execute 'Augment status' ]])
vim.cmd([[ command! ASignin   execute 'Augment signin' ]])
vim.cmd([[ command! ASignout  execute 'Augment signout' ]])
vim.cmd([[ command! AEnable   execute 'Augment enable' ]])
vim.cmd([[ command! ADisable  execute 'Augment disable' ]])
vim.cmd([[ command! ALog      execute 'Augment log' ]])
vim.cmd([[ command! AChat     execute 'Augment chat' ]])
vim.cmd([[ command! AChatNew  execute 'Augment chat-new' ]])
vim.cmd([[ command! AChatToggle execute 'Augment chat-toggle' ]])

---------------------------------------------------
-- Return the module (for the autocommand updater)
---------------------------------------------------
return M
