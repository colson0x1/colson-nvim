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
	"N E O V I M   F O R   S O F T W A R E   E N G I N E E R S",
	"root@colson:~$ build · break · ship",
	"",
}

-- ============================================================================
-- Highlights - neon-on-black hacker palette (high contrast, no muddy midtones)
-- Reapplied on every ColorScheme so switching themes never washes it out.
-- ============================================================================
local function apply_highlights()
	local hl = vim.api.nvim_set_hl
	-- Core dashboard groups (both layouts)
	hl(0, "DashboardHeader", { fg = "#00ff9f", bold = true }) -- matrix green banner
	hl(0, "DashboardDesc", { fg = "#e6edf3" }) -- crisp white entries
	hl(0, "DashboardIcon", { fg = "#00e5ff" }) -- neon cyan icons
	hl(0, "DashboardKey", { fg = "#ff2ea6", bold = true }) -- neon magenta hotkeys
	hl(0, "DashboardFooter", { fg = "#56d364" }) -- terminal green footer
	hl(0, "DashboardShortCut", { fg = "#00e5ff", bold = true })
	-- Hyper-layout groups
	hl(0, "DashboardProjectTitle", { fg = "#00ff9f", bold = true })
	hl(0, "DashboardProjectTitleIcon", { fg = "#00e5ff" })
	hl(0, "DashboardProjectIcon", { fg = "#00e5ff" })
	hl(0, "DashboardMruTitle", { fg = "#00ff9f", bold = true })
	hl(0, "DashboardMruIcon", { fg = "#00e5ff" })
	hl(0, "DashboardFiles", { fg = "#c9d1d9" })
	hl(0, "DashboardShortCutIcon", { fg = "#00ff9f", bold = true })
	-- Custom groups for the hyper shortcut pills
	hl(0, "ColsonDashSync", { fg = "#00ff9f", bold = true })
	hl(0, "ColsonDashFiles", { fg = "#00e5ff", bold = true })
	hl(0, "ColsonDashGrep", { fg = "#ff2ea6", bold = true })
	hl(0, "ColsonDashTree", { fg = "#ffb000", bold = true }) -- amber terminal
	hl(0, "ColsonDashConfig", { fg = "#bd93f9", bold = true }) -- violet
	hl(0, "ColsonDashQuit", { fg = "#ff5555", bold = true })
end

apply_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("colson-dashboard-hl", { clear = true }),
	callback = apply_highlights,
})

-- Footer is a plain function with NO upvalues (see design notes above).
local footer = function()
	local lines = { "", "colson-nvim · https://github.com/colson0x1/colson-nvim" }
	local v = vim.version()
	local status = string.format("NVIM v%d.%d.%d", v.major, v.minor, v.patch)
	local ok, lazy = pcall(require, "lazy")
	if ok then
		local stats = lazy.stats()
		status = string.format("⚡ %s · %d plugins · %.0f ms", status, stats.count, stats.startuptime)
	end
	table.insert(lines, 2, status)
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
				{ icon = "  ", desc = "Find File            ", key = "f", action = "Telescope find_files" },
				{ icon = "󰄉  ", desc = "Recent Files         ", key = "r", action = "Telescope oldfiles" },
				{ icon = "󰱼  ", desc = "Live Grep            ", key = "g", action = "Telescope live_grep" },
				{ icon = "󰙅  ", desc = "File Explorer        ", key = "e", action = "NvimTreeToggle" },
				{ icon = "󰝒  ", desc = "New File             ", key = "n", action = "enew | startinsert" },
				{ icon = "󰒓  ", desc = "Neovim Config        ", key = "c", action = open_config },
				{ icon = "󰓦  ", desc = "Sync Plugins         ", key = "u", action = "Lazy sync" },
				{ icon = "󰗼  ", desc = "Quit                 ", key = "q", action = "qa" },
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
				{ desc = "󰊳 Sync", group = "ColsonDashSync", action = "Lazy sync", key = "u" },
				{ icon = " ", icon_hl = "ColsonDashFiles", desc = "Files", group = "ColsonDashFiles", action = "Telescope find_files", key = "f" },
				{ desc = " Grep", group = "ColsonDashGrep", action = "Telescope live_grep", key = "g" },
				{ desc = " Tree", group = "ColsonDashTree", action = "NvimTreeToggle", key = "e" },
				{ desc = " Config", group = "ColsonDashConfig", action = open_config, key = "c" },
				{ desc = " Quit", group = "ColsonDashQuit", action = "qa", key = "q" },
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
-- Polish: swallow stray edit keys on the dashboard buffer
-- ============================================================================
-- The dashboard is non-modifiable, so accidental presses of i/o/p/d/... flash
-- "E21: Cannot make changes" at the bottom. Map the common edit keys to
-- no-ops - but NEVER shadow the dashboard's own hotkeys: anything already
-- buffer-mapped (f/r/g/e/n/c/u/q, Enter, ...) is detected and skipped.
-- Scheduled so it runs after the theme has registered its hotkeys.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = vim.api.nvim_create_augroup("colson-dashboard-noedit", { clear = true }),
	callback = function(ev)
		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(ev.buf) then
				return
			end
			local taken = {}
			for _, map in ipairs(vim.api.nvim_buf_get_keymap(ev.buf, "n")) do
				taken[map.lhs] = true
			end
			local edit_keys = { "i", "I", "a", "A", "o", "O", "x", "X", "s", "S", "d", "D", "p", "P", "J", "R", "U" }
			for _, key in ipairs(edit_keys) do
				if not taken[key] then
					vim.keymap.set("n", key, "<Nop>", { buffer = ev.buf, silent = true })
				end
			end
		end)
	end,
})

-- ============================================================================
-- Directory launches: `nvim .` / `nvim ~/project`
-- ============================================================================
-- dashboard-nvim's built-in trigger only fires with ZERO arguments; a single
-- directory argument lands in netrw/nvim-tree instead. This handler scopes
-- the session to that directory (:cd) and shows the dashboard, so `nvim .`
-- behaves exactly like `nvim` - with Find File / Grep already rooted in the
-- project. Runs once at UIEnter, after the plugin's own handler has bailed.
-- Directory launches (`nvim .` / `nvim ~/project`) deliberately SKIP the
-- dashboard: they cd into the project and open Telescope find_files instead.
-- That flow lives in lua/colson/startup.lua. The dashboard owns exactly one
-- startup path: a bare `nvim` with no arguments.

-- ============================================================================
-- Initial Setup - DOOM by default (before UIEnter, so the dashboard renders
-- automatically when Neovim starts with no file arguments)
-- ============================================================================
apply_theme(vim.g.colson_dashboard_theme or "doom")
