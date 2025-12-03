-- @ rpc for Discord

-- Ensure the plugin is available
local status_ok, cord = pcall(require, "cord")
if not status_ok then
	return
end

-- Function to find Discord IPC path and set permissions
local function fix_discord_ipc_permissions()
	-- Common Discord IPC paths (without using getuid())
	local possible_paths = {
		"/run/user/1000/discord-ipc-0", -- Common path for first user
		"/tmp/discord-ipc-0",
		"/tmp/discord-ipc-*",
		os.getenv("XDG_RUNTIME_DIR") and (os.getenv("XDG_RUNTIME_DIR") .. "/discord-ipc-0") or nil,
		os.getenv("TMPDIR") and (os.getenv("TMPDIR") .. "/discord-ipc-0") or nil,
		os.getenv("HOME") and (os.getenv("HOME") .. "/.discord/discord-ipc-0") or nil,
	}

	for _, path in ipairs(possible_paths) do
		if path and vim.fn.filereadable(path) == 1 then
			-- Try to fix permissions using shell command
			vim.fn.system("chmod 0666 " .. path)
			vim.notify("Fixed permissions for Discord IPC socket: " .. path, vim.log.levels.INFO)
			return path
		end
	end

	-- Try a wildcard search for the socket
	local socket_paths = vim.fn.glob("/run/user/*/discord-ipc-*", false, true)
	if #socket_paths > 0 then
		vim.fn.system("chmod 0666 " .. socket_paths[1])
		vim.notify("Fixed permissions for Discord IPC socket: " .. socket_paths[1], vim.log.levels.INFO)
		return socket_paths[1]
	end

	vim.notify("Could not find Discord IPC socket. Make sure Discord is running.", vim.log.levels.WARN)
	return nil
end

-- Try to fix permissions
local discord_ipc_path = fix_discord_ipc_permissions()

-- Configure cord.nvim with the default settings from the documentation
cord.setup({
	enabled = true,
	log_level = vim.log.levels.INFO, -- Enable logging for troubleshooting
	editor = {
		client = "neovim",
		tooltip = "The Superior Text Editor",
		icon = nil,
	},
	display = {
		theme = "default",
		flavor = "dark",
		swap_fields = false,
		swap_icons = false,
	},
	timestamp = {
		enabled = true,
		reset_on_idle = false,
		reset_on_change = false,
	},
	idle = {
		enabled = true,
		timeout = 300000,
		show_status = true,
		ignore_focus = true,
		unidle_on_focus = true,
		smart_idle = true,
		details = "Idling",
		state = nil,
		tooltip = "💤",
		icon = nil,
	},
	text = {
		workspace = function(opts)
			return "In " .. opts.workspace
		end,
		viewing = function(opts)
			return "Viewing " .. opts.filename
		end,
		editing = function(opts)
			return "Editing " .. opts.filename
		end,
		file_browser = function(opts)
			return "Browsing files in " .. opts.name
		end,
		plugin_manager = function(opts)
			return "Managing plugins in " .. opts.name
		end,
		lsp = function(opts)
			return "Configuring LSP in " .. opts.name
		end,
		docs = function(opts)
			return "Reading " .. opts.name
		end,
		vcs = function(opts)
			return "Committing changes in " .. opts.name
		end,
		notes = function(opts)
			return "Taking notes in " .. opts.name
		end,
		debug = function(opts)
			return "Debugging in " .. opts.name
		end,
		test = function(opts)
			return "Testing in " .. opts.name
		end,
		diagnostics = function(opts)
			return "Fixing problems in " .. opts.name
		end,
		games = function(opts)
			return "Playing " .. opts.name
		end,
		terminal = function(opts)
			return "Running commands in " .. opts.name
		end,
		dashboard = "Home",
	},
	buttons = nil,
	assets = nil,
	variables = nil,
	hooks = {
		ready = function()
			vim.notify("Cord connected to Discord successfully", vim.log.levels.INFO)
		end,
		shutdown = nil,
		pre_activity = nil,
		post_activity = nil,
		idle_enter = nil,
		idle_leave = nil,
		workspace_change = nil,
	},
	plugins = nil,
	advanced = {
		plugin = {
			autocmds = true,
			cursor_update = "on_hold",
			match_in_mappings = true,
		},
		server = {
			update = "fetch",
			pipe_path = discord_ipc_path, -- Use the detected IPC path
			executable_path = nil,
			timeout = 300000,
		},
		discord = {
			reconnect = {
				enabled = true,
				interval = 5000,
				initial = true,
			},
		},
	},
})

-- Add a small delay before connecting (allows permissions to take effect)
vim.defer_fn(function()
	if cord and cord.connect then
		cord.connect()
		vim.notify("Attempting to connect to Discord...", vim.log.levels.INFO)
	end
end, 3000)

-- Add commands for debugging and control
vim.api.nvim_create_user_command("CordConnect", function()
	-- Try to fix permissions again before connecting
	fix_discord_ipc_permissions()
	if cord and cord.connect then
		cord.connect()
		vim.notify("Attempting to connect to Discord...", vim.log.levels.INFO)
	end
end, { desc = "Connect cord to Discord" })

vim.api.nvim_create_user_command("CordToggle", function()
	if cord and cord.toggle then
		cord.toggle()
	end
end, { desc = "Toggle cord Discord presence" })

vim.api.nvim_create_user_command("CordStatus", function()
	if cord and cord.status then
		local status = cord.status()
		vim.notify("Cord Status: " .. status, vim.log.levels.INFO)
	end
end, { desc = "Show cord connection status" })

vim.api.nvim_create_user_command("CordFixPermissions", function()
	local path = fix_discord_ipc_permissions()
	if path then
		vim.notify("Fixed permissions for: " .. path, vim.log.levels.INFO)
	end
end, { desc = "Fix Discord IPC permissions" })

-- Add keymaps for quick access
vim.keymap.set("n", "<leader>cd", function()
	if cord and cord.toggle then
		cord.toggle()
	end
end, { desc = "Toggle Discord presence" })

vim.keymap.set("n", "<leader>cc", function()
	-- Fix permissions before connecting
	fix_discord_ipc_permissions()
	if cord and cord.connect then
		cord.connect()
	end
end, { desc = "Connect to Discord" })

-- *******************************************************

--[[
-- /after/plugin/rpc.lua
-- This file will be automatically loaded by Neovim after the plugin is loaded

-- Ensure the plugin is available
local status_ok, cord = pcall(require, "cord")
if not status_ok then
	return
end

-- Configure cord.nvim with advanced settings for principal engineers
cord.setup({
	-- General settings
	enabled = true,
	auto_update = true,
	debug_logging = false,
	log_file = vim.fn.stdpath("cache") .. "/cord.log",
	startup_delay = 5, -- seconds to wait after Neovim starts before initializing cord

	-- Discord Rich Presence settings
	rich_presence = {
		enabled = true,
		show_time = true, -- Show elapsed time in status
		show_file_details = true, -- Show file details like size, type
		compact_mode = false, -- Show more detailed information
		update_interval = 30, -- Update interval in seconds - lower for faster updates
		idle_timeout = 600, -- 10 minutes idle timeout
		idle_text = "Contemplating algorithms",
	},

	-- Workspace settings
	workspace = {
		-- Auto-detect project details for principal engineer at tech company
		auto_detect = true,

		-- Fallback project name if auto-detection fails
		default_name = "Tech Project",

		-- Override specific workspace paths with custom labels
		overrides = {
			["~/projects/core-service"] = "Core Service",
			["~/projects/api-platform"] = "API Platform",
			["~/projects/infrastructure"] = "Infrastructure",
			["~/projects/ml-models"] = "ML Models",
		},

		-- Sensitive workspaces (will show generic activity)
		private = {
			"~/projects/confidential",
			"~/projects/internal-only",
		},
	},

	-- Language-specific displays
	language_icons = {
		-- Custom language display overrides for common tech company languages
		["go"] = {
			name = "Go",
			icon = "󰟓",
			custom_text = "Optimizing Go microservices",
		},
		["rust"] = {
			name = "Rust",
			icon = "󱘗",
			custom_text = "Building robust systems in Rust",
		},
		["typescript"] = {
			name = "TypeScript",
			icon = "󰛦",
			custom_text = "Crafting type-safe frontends",
		},
		["python"] = {
			name = "Python",
			icon = "󰌠",
			custom_text = "Developing ML pipelines",
		},
		["terraform"] = {
			name = "Terraform",
			icon = "󱁢",
			custom_text = "Infrastructure as Code",
		},
		["kubernetes"] = {
			name = "K8s",
			icon = "󱃾",
			custom_text = "Orchestrating containers",
		},
	},

	-- File-specific displays (high value for principal engineers)
	file_assets = {
		["docker-compose.yml"] = {
			name = "Docker Compose",
			icon = "󰡨",
			custom_text = "Configuring container services",
		},
		["Makefile"] = {
			name = "Build System",
			icon = "󰛕",
			custom_text = "Configuring build automation",
		},
		["schema.graphql"] = {
			name = "GraphQL Schema",
			icon = "󰡷",
			custom_text = "Designing API schemas",
		},
		["package.json"] = {
			name = "Node.js Project",
			icon = "󰎙",
			custom_text = "Managing dependencies",
		},
		["pom.xml"] = {
			name = "Maven Project",
			icon = "󰏗",
			custom_text = "Java enterprise development",
		},
		["go.mod"] = {
			name = "Go Module",
			icon = "󰟓",
			custom_text = "Managing Go dependencies",
		},
		["Cargo.toml"] = {
			name = "Rust Crate",
			icon = "󱘗",
			custom_text = "Rust package management",
		},
		["requirements.txt"] = {
			name = "Python Dependencies",
			icon = "󰌠",
			custom_text = "Managing Python packages",
		},
	},

	-- Activity templates for principal engineer workflow
	activity_templates = {
		default = "{filename} - {language}",
		coding = "Building {language} services for {workspace}",
		debugging = "Debugging {filename} in {workspace}",
		refactoring = "Refactoring {language} codebase in {workspace}",
		code_review = "Reviewing code in {workspace}",
		architecture = "Designing system architecture for {workspace}",
		documentation = "Documenting {workspace} systems",
	},

	-- Advanced features for principal engineer workflow
	advanced_features = {
		-- Automatically switch activity based on file patterns
		auto_activity_detection = true,

		-- Patterns to determine activity
		activity_patterns = {
			["test_.+%.py|.*_test.go|.*Test.java|.*\\.spec\\.ts"] = "debugging",
			[".github/.*|CODEOWNERS|CONTRIBUTING.md"] = "code_review",
			["README.md|docs/.*|.*\\.md"] = "documentation",
			["architecture/.*|design/.*|rfc/.*"] = "architecture",
		},

		-- GitHub integration if available
		github_integration = {
			enabled = true,
			show_pr_info = true,
			show_branch = true,
		},

		-- Jira integration if available
		jira_integration = {
			enabled = true,
			show_ticket = true,
			extract_from_branch = true,
			branch_pattern = "([A-Z]+-\\d+)",
		},
	},

	-- Privacy settings for working with sensitive code
	privacy = {
		-- Automatically detect sensitive files and hide them
		auto_detect_sensitive = true,

		-- Patterns for sensitive files that shouldn't show in Discord status
		sensitive_patterns = {
			".*password.*",
			".*secret.*",
			".*credential.*",
			".*auth.*",
			".env",
			".*config.*",
			".*key.*",
		},

		-- Enable pause mode when in meetings or during focus time
		pause_mode = {
			enabled = true,
			keyboard_shortcut = "<leader>cd",
			status_text = "Deep focusing",
		},

		-- Completely disable during specific time frames (focus hours)
		disable_during_hours = {
			enabled = true,
			start_hour = 9, -- 9 AM
			end_hour = 11, -- 11 AM
			days = { "Monday", "Wednesday", "Friday" },
		},
	},

	-- Performance optimization for large codebases typical at major tech companies
	performance = {
		-- Skip updating status in large files to prevent editor lag
		large_file_threshold = 5000000, -- 5MB file size limit

		-- Reduce update frequency when working with large projects
		large_project_update_interval = 60, -- 1 minute update for massive repos

		-- Directories to exclude from workspace detection (common in tech companies)
		excluded_directories = {
			"node_modules",
			".git",
			"build",
			"dist",
			"target",
			"vendor",
			"bazel-bin",
			"bazel-out",
			".cache",
		},
	},

	-- Notifications for cord events
	notifications = {
		enabled = true,
		startup = false, -- Don't show notification on startup
		connection_status = true,
		error_messages = true,
	},

	-- Custom status commands for principal engineer workflows
	custom_commands = {
		{
			name = "Code Review",
			command = ":CordSetActivity code_review",
			description = "Set status to code review mode",
		},
		{
			name = "Architecture Planning",
			command = ":CordSetActivity architecture",
			description = "Set status to architecture planning",
		},
		{
			name = "Debugging Session",
			command = ":CordSetActivity debugging",
			description = "Set status to debugging mode",
		},
		{
			name = "Private Mode",
			command = ":CordTogglePrivate",
			description = "Toggle private mode for sensitive work",
		},
	},
})

-- Create user commands for quick cord actions
vim.api.nvim_create_user_command("CordSetActivity", function(opts)
	if cord and cord.set_activity then
		cord.set_activity(opts.args)
	end
end, { nargs = 1, desc = "Set cord activity" })

vim.api.nvim_create_user_command("CordTogglePrivate", function()
	if cord and cord.toggle_private then
		cord.toggle_private()
	end
end, { desc = "Toggle cord private mode" })

-- Set up keymaps for cord functions
vim.keymap.set("n", "<leader>ce", function()
	if cord and cord.toggle then
		cord.toggle()
	end
end, { desc = "Toggle cord" })

vim.keymap.set("n", "<leader>cp", function()
	if cord and cord.toggle_private then
		cord.toggle_private()
	end
end, { desc = "Toggle cord private mode" })

vim.keymap.set("n", "<leader>cs", function()
	if cord and cord.set_status then
		vim.ui.input({ prompt = "Custom status: " }, function(input)
			if input then
				cord.set_status(input)
			end
		end)
	end
end, { desc = "Set custom cord status" })
]]

-- ****************************************************************
--[[
-- Load cord.nvim safely
local ok, cord = pcall(require, "cord")
if not ok then
	return
end



 cord.setup({
	-- General Options
	client_id = "1157438221865717891", -- Replace with your Discord application's client ID
	logo = "auto", -- Automatically use a logo image, or provide a custom URL
	logo_tooltip = "Neovim powered in Silicon Valley", -- Custom tooltip text for the logo
	main_image = "logo", -- Options: "logo" or "language"
	log_level = "info", -- Log level: "debug", "info", "warn", or "error"
	debounce_timeout = 300, -- Debounce interval (seconds) to prevent rapid updates
	blacklist = {}, -- Add patterns to disable Rich Presence for specific files/paths
	file_assets = { -- Define custom file asset mappings if needed
		lua = "lua",
		js = "javascript",
		ts = "typescript",
	},
	show_time = true, -- Display an elapsed time counter in Discord
	global_timer = false, -- Set to true if you want a timer that’s global across buffers

	-- Rich Presence Text Options
	editing_text = function(file)
		local filename = vim.fn.fnamemodify(file, ":t")
		return string.format("Editing %s", filename)
	end,

	reading_text = function(file)
		local filename = vim.fn.fnamemodify(file, ":t")
		return string.format("Reviewing %s", filename)
	end,

	file_explorer_text = function(explorer)
		return string.format("Browsing %s", explorer)
	end,

	git_commit_text = "Committing changes",
	plugin_manager_text = "Managing plugins",
	terminal_text = "Terminal session active",
	line_number_text = function(current, total)
		return string.format("Line %d of %d", current, total)
	end,

	-- Workspace Text: Reflects the current project structure
	workspace_text = function(_, filename)
		local cwd = vim.fn.getcwd()
		local relative_path = vim.fn.fnamemodify(filename, ":~:.")
		local parts = vim.split(relative_path, "/")
		-- Remove the filename from the path parts
		local file_removed = table.remove(parts, #parts)
		-- If the removed file matches the root directory name, remove an additional layer
		if file_removed == vim.fn.fnamemodify(cwd, ":t") then
			file_removed = table.remove(parts, #parts)
		end
		return string.format("%s → /%s", vim.fn.fnamemodify(cwd, ":t"), table.concat(parts, "/"))
	end,
}) ]]
