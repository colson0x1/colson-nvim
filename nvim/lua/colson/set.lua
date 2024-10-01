--mocha vim.opt.guicursor = ""

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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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

local cb = require("diffview.config").diffview_callback

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
vim.api.nvim_set_keymap("n", "<leader>api", ":Http<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ter", ":HttpStop<CR>", { noremap = true, silent = true })

-- Packer Sync
vim.api.nvim_set_keymap("n", "<leader>po", ":PackerSync<CR>", { noremap = true, silent = true })
-- Source file + Packer Sync
vim.api.nvim_set_keymap("n", "<leader>pac", ":so %<CR>:PackerSync<CR>", { noremap = true, silent = true })
