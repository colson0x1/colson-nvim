-- Global settings: disable Copilot in filetypes where inline suggestions might be distracting.
--[[
vim.g.copilot_filetypes = {
	markdown = false, -- disable for markdown files
	help = false, -- disable for help buffers
	gitcommit = false, -- disable for git commit messages
}
]]

-- Disable the default <Tab> mapping so we can define our own custom keymaps.
vim.g.copilot_no_tab_map = true

-- Define our key mapping function and options.
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- @ Configurations
-- Setup Copilot: Authenticate and enable GitHub Copilot.
keymap("n", "<leader>csi", ":Copilot setup<CR>", opts)

-- Disable Copilot inline suggestions.
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)

-- Enable Copilot inline suggestions.
keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)

-- Sign out of GitHub Copilot.
keymap("n", "<leader>cso", ":Copilot signout<CR>", opts)

-- Show Copilot status.
keymap("n", "<leader>cs", ":Copilot status<CR>", opts)

-------------------------------------------------
-- Suggestion Navigation Keymaps
-------------------------------------------------

-- Accept the current Copilot suggestion (mapped to both <leader>j and Ctrl+j).
-- keymap("i", "<leader>j", 'copilot#Accept("<CR>")', { expr = true, silent = true })
keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- Cycle to the next suggestion.
keymap("i", "<leader>cn", "copilot#Next()<CR>", { expr = true, silent = true })

-- Cycle to the previous suggestion.
keymap("i", "<leader>cp", "copilot#Previous()<CR>", { expr = true, silent = true })

-------------------------------------------------

-- These commands can also be run manually in Neovim:
vim.cmd([[
  command! CopilotEnable  call copilot#Enable()
  command! CopilotDisable call copilot#Disable()
  command! CopilotSignout call copilot#Signout()
]])

-- Example autocommand: disable Copilot in quickfix windows to reduce distractions.
vim.cmd([[
  augroup CopilotAdjustments
    autocmd!
    autocmd FileType qf let b:copilot_enabled = 0
  augroup end
]])

-- Performance tuning settings for large-scale projects.
vim.g.copilot_debounce_ms = 300 -- Adjust debounce to reduce flicker.
vim.g.copilot_max_suggestions = 5 -- Limit suggestions for a cleaner UI.
