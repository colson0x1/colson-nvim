vim.opt.guicursor = "n-v-c:block,i:ver25,r-cr:hor20"
-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- Persistent undo - the directory is created if missing so undofile works
-- out of the box on fresh machines (any Linux distro / macOS).
local undodir = os.getenv("HOME") .. "/.vim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- JSX/TSX comment
vim.g.skip_ts_context_commentstring_module = true

-- /* Bufferline Tabs */
-- Switching buffers
--[[
vim.api.nvim_set_keymap("n", "<leader>B", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bf", ":bfirst<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bl", ":blast<CR>", { noremap = true, silent = true })
--]]

-- Goes to next tab
vim.api.nvim_set_keymap("n", "<leader>h", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- Goes to prev tab
vim.api.nvim_set_keymap("n", "<leader>g", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Move tab left
vim.api.nvim_set_keymap("n", "<leader>btl", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
-- Move tab right
vim.api.nvim_set_keymap("n", "<leader>btr", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })

-- Delete current tab
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
-- Deletes all tabs on left hand side
vim.api.nvim_set_keymap("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { noremap = true, silent = true })
-- Deletes all tabs on right hand side
vim.api.nvim_set_keymap("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { noremap = true, silent = true })
-- Close all tabs except currently opened one
vim.api.nvim_set_keymap("n", "<leader>abc", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

-- Indent Line
vim.g.indentLine_enabled = 1
vim.g.indentLine_char = "│"
vim.g.indentLine_fileTypeExclude = { "help", "dashboard", "packer", "NvimTree" }
vim.g.indentLine_showFirstIndentLevel = 1
vim.g.indentLine_setColors = 1

-- ============================================================================
-- @ Diff -> Diffview Configuration (Enterprise-Grade Error Handling)
-- ============================================================================
-- Note: diffview_callback API has changed in recent versions
-- Using pcall for safe loading and modern Diffview actions
local diffview_ok, diffview_actions = pcall(require, "diffview.actions")
local cb = nil

if diffview_ok then
	cb = diffview_actions
else
	-- Fallback for older API or when diffview is not installed yet
	local status, diffview_config = pcall(require, "diffview.config")
	if status and diffview_config.diffview_callback then
		cb = diffview_config.diffview_callback
	end
end

-- @ Diff -> General Diffview keymaps
vim.api.nvim_set_keymap("n", "<leader>do", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>df", ":DiffviewToggleFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFocusFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":DiffviewRefreshFiles<CR>", { noremap = true, silent = true })

-- @ Diff -> File panel navigation
vim.api.nvim_set_keymap(
	"n",
	"<leader>dp",
	":lua require('diffview.config').diffview_callback('prev_entry')<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>dn",
	":lua require('diffview.config').diffview_callback('next_entry')<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>dt",
	":lua require('diffview.config').diffview_callback('select_entry')<CR>",
	{ noremap = true, silent = true }
)

-- @ Diff -> File history panel
vim.api.nvim_set_keymap("n", "<leader>dh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dl", ":DiffviewClose<CR>", { noremap = true, silent = true })

-- Http Client
-- vim.api.nvim_set_keymap("n", "<leader>api", ":Http<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ter", ":HttpStop<CR>", { noremap = true, silent = true })

-- Packer Sync
vim.api.nvim_set_keymap("n", "<leader>po", ":PackerSync<CR>", { noremap = true, silent = true })
-- Source file + Packer Sync
vim.api.nvim_set_keymap("n", "<leader>pac", ":so %<CR>:PackerSync<CR>", { noremap = true, silent = true })

-- Git Merge
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>GitConflictChooseOurs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cb", "<cmd>GitConflictChooseBoth<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>c0", "<cmd>GitConflictChooseNone<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>GitConflictNextConflict<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>GitConflictPrevConflict<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cs", "<cmd>GitConflictListQf<CR>", { noremap = true, silent = true })

-- @ Markdown Preview
-- Map <leader>mp to start the Markdown preview.
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
-- Map <leader>ms to stop the Markdown preview.
vim.api.nvim_set_keymap("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })
-- Map <leader>mt to toggle the Markdown preview.
vim.api.nvim_set_keymap("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
