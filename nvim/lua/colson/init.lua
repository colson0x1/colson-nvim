-- ============================================================================
-- Colson's Neovim - Main Configuration Loader (Enterprise-Grade)
-- Author: Colson (@colson0x1)
-- GitHub: https://github.com/colson0x1/colson-nvim
-- ============================================================================

-- ============================================================================
-- STAGE 1: Core Settings (No Plugin Dependencies)
-- ============================================================================
-- remap.lua sets mapleader and MUST run before the plugin manager loads.
require("colson.remap")
require("colson.set")

-- ============================================================================
-- STAGE 2: Plugin Manager (lazy.nvim - bootstraps itself if missing)
-- ============================================================================
local lazy_ok, lazy_err = pcall(require, "colson.lazy")
if not lazy_ok then
	vim.notify(
		"⚠ Plugin manager failed to initialize - continuing with core Neovim.\n" .. tostring(lazy_err),
		vim.log.levels.WARN
	)
	-- Don't return - allow basic Neovim functionality
end

-- ============================================================================
-- STAGE 3: Optional LSP Loading (Safe Fallback)
-- ============================================================================
local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
	vim.notify("ℹ LSP-zero not installed yet. Run :Lazy sync to install plugins", vim.log.levels.INFO)
	-- Don't return - allow Neovim to function without LSP
end

-- ============================================================================
-- STAGE 4: Startup Behavior (Load unconditionally - has own safety checks)
-- ============================================================================
-- Always load startup.lua - it has its own pcall checks
local startup_load_ok = pcall(require, "colson.startup")
if not startup_load_ok then
	-- Startup not available yet - no problem
end
