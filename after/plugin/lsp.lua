local status, lsp = pcall(require, "lsp-zero")
if not status then
	return
end

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	if client.name == "jdtls" then
		vim.api.nvim_buf_set_option(bufnr, "formatprg", "eclipse_jdtls")
		vim.api.nvim_buf_set_option(bufnr, "formatoptions", "tcqrn1")
		vim.api.nvim_buf_set_option(bufnr, "tabstop", 4)
		vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 4)
	end
end)

-- Custom hover handler
vim.lsp.handlers["textDocument/hover"] = function(_, result, ct, config)
	if not (result and result.contents) then
		return
	end
	vim.lsp.util.open_floating_preview(
		vim.lsp.util.convert_input_to_markdown_lines(result.contents),
		"markdown",
		config
	)
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"angularls",
		"ansiblels",
		"asm_lsp",
		"bashls",
		"cssls",
		"cssmodules_ls",
		"somesass_ls",
		"clangd",
		"cmake",
		"csharp_ls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		"elixirls",
		"emmet_language_server",
		"erlangls",
		"golangci_lint_ls",
		"gopls",
		"gradle_ls",
		"graphql",
		"html",
		"htmx",
		"helm_ls",
		"jsonls",
		"jdtls",
		"java_language_server",
		"quick_lint_js",
		-- "tsserver", -- Removed
		"lua_ls",
		"marksman",
		"nginx_language_server",
		"prismals",
		"pyright",
		"rust_analyzer",
		"sqlls",
		"solidity_ls",
		"svelte",
		"tailwindcss",
		"terraformls",
		"tflint",
		"biome",
		"vuels",
		"yamlls",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		["typescript-tools"] = function()
			require("typescript-tools").setup({})
		end,
	},
})

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
	},
	formatting = lsp.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-k>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

-- @ Java
-- local lspconfig = require("lspconfig")
--
-- lspconfig.jdtls.setup({
-- 	cmd = { "jdtls" },
-- 	filetypes = { "java" },
-- 	root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build"),
-- }) ]]
