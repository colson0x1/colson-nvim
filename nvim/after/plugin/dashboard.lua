-- ============================================================================
-- @ Dashboard - nvimdev/dashboard-nvim (Enterprise-Grade Configuration)
-- Author: Colson (@colson0x1)
-- Description: Start screen with BOTH layouts configured - DOOM (default)
--              and HYPER - switchable at runtime.
--
-- Commands:
--   :Dashboard              - open the dashboard (current theme)
--   :DashboardDoom          - switch to the doom layout and open it
--   :DashboardHyper         - switch to the hyper layout and open it
--   :DashboardToggleTheme   - toggle doom <-> hyper and open it
--
-- Default theme: doom. Override for a session before startup with
--   vim.g.colson_dashboard_theme = "hyper"   (e.g. from lua/colson/set.lua)
--
-- Design notes (why it's built this way):
--   - Action callbacks are written WITHOUT upvalues: dashboard-nvim
--     serializes function actions with string.dump() when it caches its
--     config; closures over locals would silently lose state.
--   - String actions are preferred where a user command exists - they
--     survive dashboard-nvim's JSON config cache verbatim.
--   - No hardcoded paths: everything derives from vim.fn.stdpath(), so the
--     config behaves identically on any Linux distribution and macOS.
-- ============================================================================

-- Safe loading with proper error handling
local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

-- ============================================================================
-- Shared Header (true-black monochrome friendly - colors come from the theme)
-- ============================================================================
local header = {
	"",
	"",
	" ██████╗ ██████╗ ██╗     ███████╗ ██████╗ ███╗   ██╗",
	"██╔════╝██╔═══██╗██║     ██╔════╝██╔═══██╗████╗  ██║",
	"██║     ██║   ██║██║     ███████╗██║   ██║██╔██╗ ██║",
	"██║     ██║   ██║██║     ╚════██║██║   ██║██║╚██╗██║",
	"╚██████╗╚██████╔╝███████╗███████║╚██████╔╝██║ ╚████║",
	" ╚═════╝ ╚═════╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝",
	"",
	"AI-powered software, built to last",
	"",
}

-- Footer is a plain function with NO upvalues (see design notes above).
local footer = function()
	local lines = { "", "colson-nvim · https://github.com/colson0x1/colson-nvim" }
	local ok, lazy = pcall(require, "lazy")
	if ok then
		local stats = lazy.stats()
		table.insert(lines, 2, string.format("⚡ %d plugins loaded in %.0f ms", stats.count, stats.startuptime))
	end
	return lines
end

-- Opens this Neovim config in Telescope; falls back to a plain :edit.
-- Deliberately upvalue-free (string.dump safety - see design notes).
local open_config = function()
	local ok, builtin = pcall(require, "telescope.builtin")
	if ok then
		builtin.find_files({ cwd = vim.fn.stdpath("config"), hidden = true })
	else
		vim.cmd("edit " .. vim.fn.fnameescape(vim.fn.stdpath("config")))
	end
end

-- ============================================================================
-- Theme: DOOM (default) - vertical menu, keyboard-first
-- ============================================================================
local function doom_opts()
	return {
		theme = "doom",
		config = {
			header = header,
			vertical_center = true,
			center = {
				{ icon = " ", desc = "Find File            ", key = "f", action = "Telescope find_files" },
				{ icon = " ", desc = "Recent Files         ", key = "r", action = "Telescope oldfiles" },
				{ icon = " ", desc = "Live Grep            ", key = "g", action = "Telescope live_grep" },
				{ icon = " ", desc = "File Explorer        ", key = "e", action = "NvimTreeToggle" },
				{ icon = " ", desc = "New File             ", key = "n", action = "enew | startinsert" },
				{ icon = " ", desc = "Neovim Config        ", key = "c", action = open_config },
				{ icon = "󰊳 ", desc = "Sync Plugins         ", key = "u", action = "Lazy sync" },
				{ icon = " ", desc = "Quit                 ", key = "q", action = "qa" },
			},
			footer = footer,
		},
	}
end

-- ============================================================================
-- Theme: HYPER - shortcuts + recent projects + MRU files
-- ============================================================================
local function hyper_opts()
	return {
		theme = "hyper",
		config = {
			header = header,
			week_header = { enable = false },
			shortcut = {
				{ desc = "󰊳 Sync", group = "@property", action = "Lazy sync", key = "u" },
				{ icon = " ", icon_hl = "@variable", desc = "Files", group = "Label", action = "Telescope find_files", key = "f" },
				{ desc = " Grep", group = "DiagnosticHint", action = "Telescope live_grep", key = "g" },
				{ desc = " Tree", group = "Number", action = "NvimTreeToggle", key = "e" },
				{ desc = " Config", group = "Constant", action = open_config, key = "c" },
				{ desc = " Quit", group = "DiagnosticError", action = "qa", key = "q" },
			},
			project = {
				enable = true,
				limit = 8,
				icon = " ",
				label = " Recent Projects:",
				action = "Telescope find_files cwd=",
			},
			mru = {
				enable = true,
				limit = 10,
				icon = " ",
				label = " Recent Files:",
				cwd_only = false,
			},
			footer = footer,
		},
	}
end

-- ============================================================================
-- Theme Selection + Runtime Switching
-- ============================================================================
local themes = {
	doom = doom_opts,
	hyper = hyper_opts,
}

local function apply_theme(name)
	if not themes[name] then
		vim.notify("Dashboard: unknown theme '" .. tostring(name) .. "' (doom|hyper)", vim.log.levels.WARN)
		name = "doom"
	end
	vim.g.colson_dashboard_theme = name
	dashboard.setup(themes[name]())
end

local function switch_and_open(name)
	-- :Dashboard silently no-ops when the current buffer is an existing
	-- dashboard (dashboard buffers are non-modifiable and instance() bails on
	-- them). Swap in a scratch buffer first so the switch re-renders. The old
	-- dashboard wipes itself (bufhidden=wipe) and dashboard-nvim's BufEnter
	-- cleanup resets its internal ctx - so the theme MUST be applied after
	-- this point, never before.
	if vim.bo.filetype == "dashboard" then
		vim.cmd("enew")
	end
	apply_theme(name)
	vim.cmd("Dashboard")
end

vim.api.nvim_create_user_command("DashboardDoom", function()
	switch_and_open("doom")
end, { desc = "Dashboard: switch to the doom layout" })

vim.api.nvim_create_user_command("DashboardHyper", function()
	switch_and_open("hyper")
end, { desc = "Dashboard: switch to the hyper layout" })

vim.api.nvim_create_user_command("DashboardToggleTheme", function()
	switch_and_open(vim.g.colson_dashboard_theme == "doom" and "hyper" or "doom")
end, { desc = "Dashboard: toggle doom <-> hyper" })

-- ============================================================================
-- Initial Setup - DOOM by default (before UIEnter, so the dashboard renders
-- automatically when Neovim starts with no file arguments)
-- ============================================================================
apply_theme(vim.g.colson_dashboard_theme or "doom")
