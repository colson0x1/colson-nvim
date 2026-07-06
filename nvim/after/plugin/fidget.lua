-- ============================================================================
-- @ Fidget - LSP progress indicator (Enterprise-Grade)
-- Author: Colson (@colson0x1)
-- Description: Unobtrusive bottom-right progress for language servers.
--              Shows indexing/loading state of tsserver, jdtls, gopls, etc.
--              - essential feedback on large monorepos.
-- ============================================================================

-- Safe loading with proper error handling
local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end

fidget.setup({
	progress = {
		display = {
			done_ttl = 2, -- seconds a completed task stays visible
		},
	},
	notification = {
		window = {
			winblend = 0, -- opaque on true-black terminals (no muddy blending)
		},
	},
})
