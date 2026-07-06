-- ============================================================================
-- Colson's Neovim - Plugin Manager Core (lazy.nvim)
-- Author: Colson (@colson0x1)
-- GitHub: https://github.com/colson0x1/colson-nvim
-- ============================================================================
-- WHY lazy.nvim (2026):
--   packer.nvim was archived upstream in August 2023 and receives no fixes.
--   lazy.nvim is the actively maintained standard: lockfile-based
--   reproducibility (lazy-lock.json), atomic installs, build hooks, and
--   identical behavior across Linux distributions and macOS.
--
-- ARCHITECTURE (unchanged from the Packer era, by design):
--   - Plugin DECLARATIONS live in lua/colson/plugins/*.lua (domain modules)
--   - Plugin CONFIGURATIONS live in after/plugin/*.lua (sourced after load)
--   - lua/colson/packer.lua is kept on disk as a historical reference only
--
-- REPRODUCIBILITY:
--   lazy-lock.json pins every plugin to an exact commit. On a fresh machine
--   the identical plugin set is restored with `:Lazy restore`. Commit the
--   lockfile alongside the config.
-- ============================================================================

-- ============================================================================
-- STAGE A: Preconditions (portable across Linux + macOS)
-- ============================================================================
if vim.fn.executable("git") == 0 then
	vim.notify(
		"⚠ git is not installed - plugin management disabled.\n"
			.. "Install git (e.g. `pacman -S git`, `apt install git`, `xcode-select --install`) and restart Neovim.",
		vim.log.levels.ERROR
	)
	return false
end

-- ============================================================================
-- STAGE B: Bootstrap lazy.nvim (idempotent, safe on fresh machines)
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local uv = vim.uv or vim.loop -- vim.loop is deprecated on 0.10+; support both

if not uv.fs_stat(lazypath) then
	vim.notify("Installing lazy.nvim (plugin manager)...", vim.log.levels.INFO)
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.notify("⚠ Failed to clone lazy.nvim:\n" .. out, vim.log.levels.ERROR)
		return false
	end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- STAGE C: Load plugin specifications
-- ============================================================================
-- NOTE: mapleader is set in colson/remap.lua, which MUST run before this
-- module (lazy.nvim requires the leader key before plugins are loaded).
local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then
	vim.notify("⚠ lazy.nvim failed to load. Run :checkhealth lazy", vim.log.levels.ERROR)
	return false
end

lazy.setup({
	spec = {
		{ import = "colson.plugins" },
	},

	defaults = {
		-- Eager-load everything by default: mirrors Packer's `start/` behavior
		-- so every after/plugin/*.lua config finds its plugin at startup.
		-- Plugins that were already lazy under Packer (markdown-preview,
		-- git-rebase-auto-diff) declare their own ft/cmd triggers.
		lazy = false,
		-- Never auto-resolve to latest tag; the lockfile is the source of truth.
		version = false,
	},

	install = {
		missing = true,
		-- Colorscheme used during a fresh headless install (before tokyonight
		-- is available). habamax ships with Neovim itself.
		colorscheme = { "tokyonight", "habamax" },
	},

	-- No background update checks: updates are explicit (:Lazy sync) and then
	-- captured in lazy-lock.json. Determinism over novelty.
	checker = { enabled = false },
	change_detection = { enabled = true, notify = false },

	-- luarocks support is disabled: no plugin here needs it, and requiring a
	-- system luarocks/hererocks would hurt portability across distros.
	rocks = { enabled = false },

	performance = {
		rtp = {
			-- IMPORTANT: netrw stays ENABLED - <leader>pv maps to :Ex (netrw).
			-- Only prune plugins that are genuinely unused.
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- ============================================================================
-- STAGE D: Packer compatibility shims (muscle-memory preservation)
-- ============================================================================
-- Existing keymaps and habits (<leader>po -> :PackerSync, <leader>pac) keep
-- working. Each shim delegates to the lazy.nvim equivalent.
local packer_shims = {
	PackerSync = "Lazy sync",
	PackerInstall = "Lazy install",
	PackerUpdate = "Lazy update",
	PackerClean = "Lazy clean",
	PackerStatus = "Lazy home",
}

for shim, target in pairs(packer_shims) do
	vim.api.nvim_create_user_command(shim, function()
		vim.cmd(target)
	end, { desc = "Packer compat shim -> :" .. target })
end

-- PackerCompile has no lazy.nvim equivalent (no compile step exists anymore).
vim.api.nvim_create_user_command("PackerCompile", function()
	vim.notify("lazy.nvim has no compile step - nothing to do.", vim.log.levels.INFO)
end, { desc = "Packer compat shim (no-op under lazy.nvim)" })

return true
