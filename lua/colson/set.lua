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
vim.api.nvim_set_keymap("n", "<leader>b", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>B", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bf", ":bfirst<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bl", ":blast<CR>", { noremap = true, silent = true })

-- Closing tabs
vim.api.nvim_set_keymap("n", "<leader>td", ":tabclose<CR>", { noremap = true, silent = true })

-- Closing current buffer
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
