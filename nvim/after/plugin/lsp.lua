local status, lsp = pcall(require, "lsp-zero")
if not status then
	return
end

-- Silent function to check if a command exists on the system
local function command_exists(command)
	-- Use vim's executable function which is silent and more reliable
	return vim.fn.executable(command) == 1
end

-- Map of language/tool detectors to LSP servers
local lsp_detectors = {
	-- Format: language/tool = {detection_command, lsp_server}
	angular = { "ng", "angularls" },
	ansible = { "ansible", "ansiblels" },
	assembly = { "nasm", "asm_lsp" },
	bash = { "bash", "bashls" },
	c = { "gcc", "clangd" },
	cpp = { "g++", "clangd" },
	cmake = { "cmake", "cmake" },
	csharp = { "dotnet", "csharp_ls" },
	css = { "node", "cssls" },
	cssmodules = { "node", "cssmodules_ls" },
	sass = { "sass", "somesass_ls" },
	docker = { "docker", "dockerls" },
	compose = { "docker-compose", "docker_compose_language_service" },
	eslint = { "eslint", "eslint" },
	elixir = { "elixir", "elixirls" },
	emmet = { "node", "emmet_language_server" },
	-- FIXED (2026-07-06): keyed on rebar3 (not erl) - erlang-ls builds from
	-- source WITH rebar3; machines that only have erl as an Elixir runtime
	-- dependency were hitting a failing install at every startup.
	erlang = { "rebar3", "erlangls" },
	golangci = { "golangci-lint", "golangci_lint_ls" },
	go = { "go", "gopls" },
	gradle = { "gradle", "gradle_ls" },
	graphql = { "node", "graphql" },
	html = { "node", "html" },
	htmx = { "node", "htmx" },
	helm = { "helm", "helm_ls" },
	json = { "node", "jsonls" },
	java = { "java", "jdtls" },
	javaserver = { "java", "java_language_server" },
	javascript = { "node", "quick_lint_js" },
	-- FIXED (2026-07-06): lspconfig renamed "tsserver" -> "ts_ls"; the old
	-- name made mason-lspconfig raise a blocking warning at startup.
	-- (typescript-tools.nvim remains the actual TS engine - see
	-- typescript-engine.lua; ts_ls here only ensures the mason install.)
	typescript = { "tsc", "ts_ls" },
	lua = { "lua", "lua_ls" },
	markdown = { "node", "marksman" },
	astgrep = { "ast-grep", "ast_grep" },
	nginx = { "nginx", "nginx_language_server" },
	prisma = { "prisma", "prismals" },
	python = { "python", "pyright" },
	ruby = { "ruby", "ruby_lsp" },
	rust = { "rustc", "rust_analyzer" },
	sql = { "sqlite3", "sqlls" },
	solidity = { "solc", "solidity_ls" },
	svelte = { "node", "svelte" },
	tailwind = { "tailwindcss", "tailwindcss" },
	terraform = { "terraform", "terraformls" },
	tflint = { "tflint", "tflint" },
	biome = { "biome", "biome" },
	vue = { "vue", "vuels" },
	yaml = { "node", "yamlls" },
	protobuf = { "protoc", "pbls" },
}

-- Silently build the list of LSP servers based on what's installed
local function get_installed_lsp_servers()
	local servers = {}

	-- Always include these basic servers that should work everywhere
	table.insert(servers, "lua_ls") -- Neovim always has Lua

	for _, detector in pairs(lsp_detectors) do
		local cmd = detector[1]
		local server = detector[2]
		-- Silently check if command exists
		if command_exists(cmd) then
			table.insert(servers, server)
		end
	end

	return servers
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
		-- FIXED for 0.11.x: use vim.bo instead of nvim_buf_set_option
		vim.bo[bufnr].formatprg = "eclipse_jdtls"
		vim.bo[bufnr].formatoptions = "tcqrn1"
		vim.bo[bufnr].tabstop = 4
		vim.bo[bufnr].shiftwidth = 4
	end
end)

-- Enhanced hover handler
vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
	if not (result and result.contents) then
		return
	end

	vim.lsp.util.open_floating_preview(
		vim.lsp.util.convert_input_to_markdown_lines(result.contents),
		"markdown",
		vim.tbl_extend("force", config or {}, {
			border = "rounded",
		})
	)
end

-- Enhanced diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})

-- Safely initialize Mason
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
	return
end

mason.setup({
	ui = {
		check_outdated_packages_on_open = false, -- Prevents startup messages
		border = "rounded",
	},
})

-- Safely initialize Mason-LSPConfig
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
	return
end

-- Determine which servers to install, silently
local servers_to_install = get_installed_lsp_servers()

mason_lspconfig.setup({
	ensure_installed = servers_to_install,
	automatic_installation = false, -- Don't show installation prompts at startup
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		["typescript-tools"] = function()
			-- Only setup typescript-tools if it's available
			pcall(function()
				require("typescript-tools").setup({})
			end)
		end,
	},
})

-- Safely initialize Mason-Null-LS
local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_ok then
	return
end

-- Function to silently detect formatters/linters
local function get_installed_formatters()
	local formatters = {}

	-- Basic formatters based on what's available
	if command_exists("lua") then
		table.insert(formatters, "stylua")
	end

	if command_exists("node") then
		table.insert(formatters, "prettier")

		if command_exists("eslint") then
			table.insert(formatters, "eslint_d")
		end
	end

	return formatters
end

mason_null_ls.setup({
	ensure_installed = get_installed_formatters(),
	automatic_installation = false, -- Don't show installation prompts
})

-- Safely initialize CMP
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

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

--[[
-- @ v2
local status, lsp = pcall(require, "lsp-zero")
if not status then
	return
end

-- Function to check if a command exists on the system
local function command_exists(command)
	local handle = io.popen("command -v " .. command .. " 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result and result ~= ""
	end
	return false
end

-- Map of language/tool detectors to LSP servers
local lsp_detectors = {
	-- Format: language/tool = {detection_command, lsp_server}
	angular = { "ng", "angularls" },
	ansible = { "ansible", "ansiblels" },
	assembly = { "nasm", "asm_lsp" },
	bash = { "bash", "bashls" },
	c = { "gcc", "clangd" },
	cpp = { "g++", "clangd" },
	cmake = { "cmake", "cmake" },
	csharp = { "dotnet", "csharp_ls" },
	css = { "node", "cssls" },
	cssmodules = { "node", "cssmodules_ls" },
	sass = { "sass", "somesass_ls" },
	docker = { "docker", "dockerls" },
	compose = { "docker-compose", "docker_compose_language_service" },
	eslint = { "eslint", "eslint" },
	elixir = { "elixir", "elixirls" },
	emmet = { "node", "emmet_language_server" },
	-- FIXED (2026-07-06): keyed on rebar3 (not erl) - erlang-ls builds from
	-- source WITH rebar3; machines that only have erl as an Elixir runtime
	-- dependency were hitting a failing install at every startup.
	erlang = { "rebar3", "erlangls" },
	golangci = { "golangci-lint", "golangci_lint_ls" },
	go = { "go", "gopls" },
	gradle = { "gradle", "gradle_ls" },
	graphql = { "node", "graphql" },
	html = { "node", "html" },
	htmx = { "node", "htmx" },
	helm = { "helm", "helm_ls" },
	json = { "node", "jsonls" },
	java = { "java", "jdtls" },
	javaserver = { "java", "java_language_server" },
	javascript = { "node", "quick_lint_js" },
	-- FIXED (2026-07-06): lspconfig renamed "tsserver" -> "ts_ls"; the old
	-- name made mason-lspconfig raise a blocking warning at startup.
	-- (typescript-tools.nvim remains the actual TS engine - see
	-- typescript-engine.lua; ts_ls here only ensures the mason install.)
	typescript = { "tsc", "ts_ls" },
	lua = { "lua", "lua_ls" },
	markdown = { "node", "marksman" },
	astgrep = { "ast-grep", "ast_grep" },
	nginx = { "nginx", "nginx_language_server" },
	prisma = { "prisma", "prismals" },
	python = { "python", "pyright" },
	ruby = { "ruby", "ruby_lsp" },
	rust = { "rustc", "rust_analyzer" },
	sql = { "sqlite3", "sqlls" },
	solidity = { "solc", "solidity_ls" },
	svelte = { "node", "svelte" },
	tailwind = { "tailwindcss", "tailwindcss" },
	terraform = { "terraform", "terraformls" },
	tflint = { "tflint", "tflint" },
	biome = { "biome", "biome" },
	vue = { "vue", "vuels" },
	yaml = { "node", "yamlls" },
	protobuf = { "protoc", "pbls" },
}

-- Build the list of LSP servers based on what's installed
local function get_installed_lsp_servers()
	local servers = {}

	-- Always include these basic servers
	table.insert(servers, "jsonls")

	for lang, detector in pairs(lsp_detectors) do
		local cmd = detector[1]
		local server = detector[2]
		if command_exists(cmd) then
			table.insert(servers, server)
			print(string.format("LSP: Detected %s, enabling %s", lang, server))
		else
			print(string.format("LSP: %s not found, skipping %s", lang, server))
		end
	end

	return servers
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
		-- FIXED for 0.11.x: use vim.bo instead of nvim_buf_set_option
		vim.bo[bufnr].formatprg = "eclipse_jdtls"
		vim.bo[bufnr].formatoptions = "tcqrn1"
		vim.bo[bufnr].tabstop = 4
		vim.bo[bufnr].shiftwidth = 4
	end
end)

-- Enhanced hover handler
vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
	if not (result and result.contents) then
		return
	end

	vim.lsp.util.open_floating_preview(
		vim.lsp.util.convert_input_to_markdown_lines(result.contents),
		"markdown",
		vim.tbl_extend("force", config or {}, {
			border = "rounded",
		})
	)
end

-- Enhanced diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = get_installed_lsp_servers(),
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

-- Function to detect formatters/linters
local function get_installed_formatters()
	local formatters = {}

	-- Basic formatters most people will want
	table.insert(formatters, "stylua")

	-- Check for language-specific formatters
	if command_exists("node") then
		table.insert(formatters, "prettier")
	end

	if command_exists("eslint") then
		table.insert(formatters, "eslint_d")
	end

	return formatters
end

mason_null_ls.setup({
	ensure_installed = get_installed_formatters(),
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
--]]

--[[
-- @ v1
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
		-- FIXED for 0.11.x: use vim.bo instead of nvim_buf_set_option
		vim.bo[bufnr].formatprg = "eclipse_jdtls"
		vim.bo[bufnr].formatoptions = "tcqrn1"
		vim.bo[bufnr].tabstop = 4
		vim.bo[bufnr].shiftwidth = 4
	end
end)

-- Enhanced hover handler
vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
	if not (result and result.contents) then
		return
	end

	vim.lsp.util.open_floating_preview(
		vim.lsp.util.convert_input_to_markdown_lines(result.contents),
		"markdown",
		vim.tbl_extend("force", config or {}, {
			border = "rounded",
		})
	)
end

-- Enhanced diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- "angularls",
		-- "ansiblels",
		-- "asm_lsp",
		"bashls",
		"cssls",
		"cssmodules_ls",
		"somesass_ls",
		-- "clangd",
		-- "cmake",
		-- "csharp_ls",
		"dockerls",
		"docker_compose_language_service",
		"eslint",
		-- "elixirls",
		"emmet_language_server",
		-- "erlangls",
		"golangci_lint_ls",
		"gopls",
		-- "gradle_ls",
		"graphql",
		"html",
		-- "htmx",
		-- "helm_ls",
		"jsonls",
		-- "jdtls",
		-- "java_language_server",
		"quick_lint_js",
		-- "tsserver",
		"lua_ls",
		"marksman",
		-- "ast_grep",
		-- "nginx_language_server",
		"prismals",
		"pyright",
		-- "ruby_lsp",
		"rust_analyzer",
		"sqlls",
		-- "solidity_ls",
		-- "svelte",
		"tailwindcss",
		"terraformls",
		"tflint",
		"tflint",
		"biome",
		"vuels",
		"yamlls",
		-- "pbls",
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
--]]

-- @ Java
-- local lspconfig = require("lspconfig")
--
-- lspconfig.jdtls.setup({
-- 	cmd = { "jdtls" },
-- 	filetypes = { "java" },
-- 	root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build"),
-- }) ]]
