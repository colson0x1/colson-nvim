-- ============================================================================
-- Colson's Neovim - none-ls Configuration (Maintained null-ls fork)
-- Author: Colson (@colson0x1)
-- Compatible with: Neovim 0.11.x+
-- ============================================================================

local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Build sources dynamically to handle missing tools gracefully
local sources = {
	formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
	formatting.stylua,
}

-- Add eslint_d only if available
if diagnostics.eslint_d then
	table.insert(
		sources,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		})
	)
end

null_ls.setup({
	sources = sources,

	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
