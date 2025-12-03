-- ============================================================================
-- Colson's Neovim Configuration - Enterprise Grade (Packer Edition)
-- Author: Colson (@colson0x1)
-- GitHub: https://github.com/colson0x1/colson-nvim
-- Version: 2.0 (Production Stable for 0.11.x+ | Distinguished Engineer Architecture)
-- ============================================================================

-- ============================================================================
-- Bootstrap Packer (Plugin Manager) - Load FIRST
-- ============================================================================
-- Ensure Packer is installed before loading any plugins
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		vim.notify("Installing Packer...", vim.log.levels.INFO)
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- ============================================================================
-- Load Plugin Specifications (Must be loaded BEFORE other configs)
-- ============================================================================
require("colson.packer")

-- ============================================================================
-- Load Core Configuration
-- ============================================================================
require("colson")

-- ============================================================================
-- Auto-Sync Packer on First Install
-- ============================================================================
if packer_bootstrap then
	vim.notify("Running PackerSync for first-time setup...", vim.log.levels.INFO)
	vim.cmd([[PackerSync]])
end
