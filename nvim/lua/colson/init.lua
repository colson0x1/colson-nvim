-- ============================================================================
-- Colson's Neovim - Main Configuration Loader (Enterprise-Grade)
-- Author: Colson (@colson0x1)
-- GitHub: https://github.com/colson0x1/colson-nvim
-- ============================================================================

-- ============================================================================
-- STAGE 1: Core Settings (No Plugin Dependencies)
-- ============================================================================
require("colson.remap")
require("colson.set")

-- ============================================================================
-- STAGE 2: Plugin Manager Verification
-- ============================================================================
local packer_installed = pcall(require, "packer")
if not packer_installed then
	vim.notify(
		"⚠ Packer not found! Installing now...\nRun :PackerSync after Neovim restarts",
		vim.log.levels.WARN
	)
	-- Don't return - allow basic Neovim functionality
end

-- ============================================================================
-- STAGE 3: Optional LSP Loading (Safe Fallback)
-- ============================================================================
local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
	vim.notify("ℹ LSP-zero not installed yet. Run :PackerSync to install plugins", vim.log.levels.INFO)
	-- Don't return - allow Neovim to function without LSP
end

-- ============================================================================
-- STAGE 4: Startup Behavior (Load unconditionally - has own safety checks)
-- ============================================================================
-- Always load startup.lua - it has its own pcall checks
-- This ensures Telescope opens on startup if available
local startup_load_ok = pcall(require, "colson.startup")
if not startup_load_ok then
	-- Startup not available yet - no problem
end
