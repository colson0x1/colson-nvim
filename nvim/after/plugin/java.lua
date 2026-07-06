-- ============================================================================
-- Enterprise-Grade Java Development Configuration for nvim-java
-- Optimized for Distributed Systems & Microservices Development
-- ============================================================================

-- Safe loading with error handling
local status_java, java = pcall(require, "java")
if not status_java then
	return
end

-- Note: lspconfig is configured through nvim-java, not directly

-- ============================================================================
-- NVIM-JAVA SETUP
-- ============================================================================

java.setup({
	-- Root markers for project detection (supports monorepos)
	root_markers = {
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		"gradlew",
		"mvnw",
		".git",
	},

	-- JDTLS Configuration
	-- FIXED (2026-07-06): versions are intentionally NOT pinned here anymore.
	-- nvim-java ships a curated jdtls<->component version map that tracks
	-- what is actually downloadable; hardcoded pins went stale when Eclipse
	-- pruned old snapshot tarballs (1.43.0 became a 404 and broke startup).
	-- Determinism is preserved because nvim-java itself is commit-pinned in
	-- lazy-lock.json. Old pins kept below for reference:
	jdtls = {
		-- version = "1.43.0", -- Latest stable version
	},

	-- Lombok support (annotation processing)
	lombok = {
		-- version = "nightly", -- Always use latest for best compatibility
	},

	-- Java Test Runner (JUnit & TestNG)
	java_test = {
		enable = true,
		-- version = "0.40.1",
	},

	-- Java Debug Adapter (DAP)
	java_debug_adapter = {
		enable = true,
		-- version = "0.58.1",
	},

	-- Spring Boot Tools
	spring_boot_tools = {
		enable = true,
		-- version = "1.55.1",
	},

	-- JDK Auto-installation (disabled - using system JDK)
	jdk = {
		auto_install = false, -- Use system-installed JDKs for control
	},

	-- Notifications (reduced noise for enterprise workflows)
	notifications = {
		dap = false, -- Suppress DAP config messages
	},
})

-- ============================================================================
-- JDTLS LSP CONFIGURATION (Enterprise Settings)
-- ============================================================================

-- Configure JDTLS through the standard LSP setup after nvim-java is initialized
local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
	vim.notify("lspconfig not available", vim.log.levels.WARN)
	return
end

-- MODERNIZED (2026-07-06): was `lspconfig.jdtls.setup({...})`. The lspconfig
-- "framework" API is deprecated (removal in nvim-lspconfig v3) and printed a
-- blocking traceback at startup. vim.lsp.config() is the supported API on
-- Neovim 0.11+; it deep-merges with the defaults nvim-java registers for
-- jdtls, and vim.lsp.enable() below activates the server per filetype.
vim.lsp.config("jdtls", {
	-- JVM arguments optimized for large-scale projects
	cmd = {
		"jdtls",
		"-Xms2g", -- Initial heap size
		"-Xmx8g", -- Maximum heap size (adjust based on RAM)
		"-XX:+UseG1GC", -- G1 garbage collector for large heaps
		"-XX:MaxGCPauseMillis=200", -- Target GC pause time
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
	},

	-- Java Language Server Settings
	settings = {
		java = {
			-- ================================================================
			-- Inlay Hints (Parameter Names)
			-- ================================================================
			inlayHints = {
				parameterNames = {
					enabled = "all", -- Show all parameter names
					exclusions = { "this" }, -- Don't show 'this'
				},
			},

			-- ================================================================
			-- Multiple JDK/Runtime Configuration
			-- ================================================================
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk",
						default = true,
					},
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk",
					},
					-- Add more JDK versions as needed
				},
			},

			-- ================================================================
			-- Import Management
			-- ================================================================
			imports = {
				gradle = { enabled = true },
				maven = { enabled = true },
				exclusions = {
					"**/node_modules/**",
					"**/.metadata/**",
					"**/archetype-resources/**",
					"**/META-INF/maven/**",
					"**/target/**", -- Maven build output
					"**/build/**", -- Gradle build output
					"**/.gradle/**", -- Gradle cache
					"**/.mvn/**", -- Maven wrapper
				},
			},

			-- ================================================================
			-- Code Generation Preferences
			-- ================================================================
			codeGeneration = {
				hashCodeEquals = {
					useJava7Objects = true, -- Use Objects.hash()
					useInstanceof = true, -- Use instanceof checks
				},
				useBlocks = true, -- Always use code blocks
				toString = {
					template = "${object.className} [${member.name()}=${member.value}, ${otherMembers}]",
				},
				insertionLocation = "afterCursor", -- Where to insert generated code
			},

			-- ================================================================
			-- Code Formatting
			-- ================================================================
			format = {
				enabled = true,
				settings = {
					-- Use Google Java Style Guide
					-- Create ~/.config/google-java-format.xml if you have custom formatter
					-- url = vim.fn.expand("~/.config/google-java-format.xml"),
					-- profile = "GoogleStyle",
				},
				comments = {
					enabled = true, -- Format comments
				},
				onType = {
					enabled = true, -- Format on type
				},
			},

			-- ================================================================
			-- Code Lens (Reference & Implementation Counters)
			-- ================================================================
			referencesCodeLens = {
				enabled = true, -- Show reference counts
			},
			implementationsCodeLens = {
				enabled = true, -- Show implementation counts
			},

			-- ================================================================
			-- Auto-build (Incremental Compilation)
			-- ================================================================
			autobuild = {
				enabled = true, -- Enable incremental builds
			},

			-- ================================================================
			-- Completion Settings (Optimized for Enterprise Java)
			-- ================================================================
			completion = {
				enabled = true,
				favoriteStaticMembers = {
					-- JUnit 5 (Jupiter)
					"org.junit.jupiter.api.Assertions.*",
					"org.junit.jupiter.api.Assumptions.*",
					"org.junit.jupiter.api.DynamicTest.*",
					-- Mockito
					"org.mockito.Mockito.*",
					"org.mockito.ArgumentMatchers.*",
					-- AssertJ
					"org.assertj.core.api.Assertions.*",
					-- Java Utilities
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"java.util.Collections.*",
					-- Spring
					"org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
					"org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
				},
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
				importOrder = {
					"java",
					"javax",
					"org",
					"com",
					"", -- Blank line before custom imports
				},
			},

			-- ================================================================
			-- Signature Help
			-- ================================================================
			signatureHelp = {
				enabled = true,
				description = {
					enabled = true, -- Show parameter descriptions
				},
			},

			-- ================================================================
			-- Content Provider (External Sources)
			-- ================================================================
			contentProvider = {
				preferred = "fernflower", -- Decompiler for external libraries
			},

			-- ================================================================
			-- Eclipse Settings
			-- ================================================================
			eclipse = {
				downloadSources = true, -- Auto-download source JARs
			},

			-- ================================================================
			-- Maven Settings
			-- ================================================================
			maven = {
				downloadSources = true,
				updateSnapshots = false, -- Don't auto-update SNAPSHOT versions
			},

			-- ================================================================
			-- Gradle Settings
			-- ================================================================
			gradle = {
				enabled = true,
				wrapper = {
					enabled = true, -- Use Gradle wrapper if available
				},
			},

			-- ================================================================
			-- Project Settings
			-- ================================================================
			project = {
				referencedLibraries = {
					"lib/**/*.jar", -- Include local JAR libraries
				},
			},

			-- ================================================================
			-- Source Actions (Organize Imports on Save)
			-- ================================================================
			sources = {
				organizeImports = {
					starThreshold = 5, -- Use * import after 5 classes
					staticStarThreshold = 3, -- Use * for static imports after 3
				},
			},
		},
	},

	-- ================================================================
	-- LSP Handlers (Suppress Noisy Notifications)
	-- ================================================================
	handlers = {
		["$/progress"] = function(_, result, ctx)
			-- Suppress progress notifications for cleaner UI
		end,
		["language/status"] = function(_, result)
			-- Suppress status notifications
		end,
	},

	-- ================================================================
	-- Capabilities (Auto-completion)
	-- ================================================================
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Activate jdtls for Java filetypes (modern replacement for the implicit
-- activation lspconfig's setup() used to perform).
vim.lsp.enable("jdtls")

-- ============================================================================
-- DAP (DEBUG ADAPTER PROTOCOL) CONFIGURATION
-- ============================================================================

local status_dap, dap = pcall(require, "dap")
if status_dap then
	local status_dapui, dapui = pcall(require, "dapui")

	if status_dapui then
		-- DAP UI Setup (Visual Debugging Interface)
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			mappings = {
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 40,
					position = "left",
				},
				{
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil,
				max_width = nil,
				border = "rounded",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
		})

		-- Auto-open DAP UI on debugging start
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end

	-- Virtual Text (Inline Variable Values)
	local status_virtual_text, virtual_text = pcall(require, "nvim-dap-virtual-text")
	if status_virtual_text then
		virtual_text.setup({
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = true,
			show_stop_reason = true,
			commented = false,
		})
	end
end

-- ============================================================================
-- NEOTEST CONFIGURATION (Advanced Testing UI)
-- ============================================================================

local status_neotest, neotest = pcall(require, "neotest")
if status_neotest then
	neotest.setup({
		adapters = {
			require("neotest-java")({
				junit_jar = nil, -- Auto-downloads from Maven Central
				incremental_build = true, -- Enable incremental builds
			}),
		},
		-- Test discovery
		discovery = {
			enabled = true,
			concurrent = 8, -- Number of concurrent workers
		},
		-- Output handling
		output = {
			enabled = true,
			open_on_run = false, -- Don't auto-open output
		},
		-- Status signs
		status = {
			enabled = true,
			signs = true,
			virtual_text = false, -- Use signs instead of virtual text
		},
		-- Quickfix integration
		quickfix = {
			enabled = true,
			open = false, -- Don't auto-open quickfix
		},
		-- Icons
		icons = {
			running = "",
			passed = "",
			failed = "",
			skipped = "",
			unknown = "",
		},
	})
end

-- ============================================================================
-- SPRING BOOT PROJECT GENERATOR (nvim-springtime)
-- ============================================================================

local status_springtime, springtime = pcall(require, "springtime")
if status_springtime then
	springtime.setup({
		spring = {
			-- Project Type
			project = {
				selected = "gradle", -- gradle, gradle-kotlin, maven
			},
			-- Language
			language = {
				selected = "java", -- java, kotlin, groovy
			},
			-- Spring Boot Version (auto-updated)
			boot = {
				selected = "3.4.1", -- Latest stable
			},
			-- Project Metadata Defaults
			metadata = {
				group = "com.example", -- Default package
				artifact = "demo", -- Default artifact name
				name = "demo", -- Default project name
				description = "Demo project for Spring Boot",
				package_name = "com.example.demo",
			},
			-- Java Version
			java = {
				selected = "17", -- Java 17 (LTS)
			},
			-- Packaging
			packaging = {
				selected = "jar", -- jar or war
			},
		},
		-- Dialog settings
		dialog = {
			border = "rounded", -- Border style
		},
	})
end

-- ============================================================================
-- KEYBINDINGS (Space as Leader)
-- ============================================================================

local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Leader key is already set to Space in your config

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ BUILD OPERATIONS                                                      ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("n", "<leader>jb", function()
	require("java").build.build_workspace()
end, "[J]ava [B]uild workspace")

map("n", "<leader>jc", ":JavaBuildCleanWorkspace<CR>", "[J]ava [C]lean workspace")

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ RUN OPERATIONS                                                        ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("n", "<leader>jr", function()
	require("java").runner.built_in.run_app()
end, "[J]ava [R]un main class")

map("n", "<leader>jR", function()
	-- Run with custom arguments (prompt user)
	local args = vim.fn.input("Program arguments: ")
	local arg_list = vim.split(args, " ", { trimempty = true })
	require("java").runner.built_in.run_app(arg_list)
end, "[J]ava [R]un with arguments")

map("n", "<leader>js", ":JavaRunnerStopMain<CR>", "[J]ava [S]top main class")

map("n", "<leader>jl", ":JavaRunnerToggleLogs<CR>", "[J]ava toggle [L]ogs")

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ TEST OPERATIONS                                                       ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("n", "<leader>jt", function()
	require("java").test.run_current_class()
end, "[J]ava run [T]est class")

map("n", "<leader>jm", function()
	require("java").test.run_current_method()
end, "[J]ava run test [M]ethod")

map("n", "<leader>jT", ":JavaTestViewLastReport<CR>", "[J]ava view [T]est report")

-- Neotest Integration (if available)
if status_neotest then
	map("n", "<leader>jtn", function()
		neotest.run.run()
	end, "[J]ava [T]est [N]earest")

	map("n", "<leader>jtf", function()
		neotest.run.run(vim.fn.expand("%"))
	end, "[J]ava [T]est [F]ile")

	map("n", "<leader>jts", function()
		neotest.summary.toggle()
	end, "[J]ava [T]est [S]ummary")

	map("n", "<leader>jto", function()
		neotest.output.open({ enter = true })
	end, "[J]ava [T]est [O]utput")

	map("n", "<leader>jtw", function()
		neotest.watch.toggle()
	end, "[J]ava [T]est [W]atch mode")
end

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ DEBUG OPERATIONS                                                      ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("n", "<leader>jdc", function()
	require("java").test.debug_current_class()
end, "[J]ava [D]ebug test [C]lass")

map("n", "<leader>jdm", function()
	require("java").test.debug_current_method()
end, "[J]ava [D]ebug test [M]ethod")

map("n", "<leader>jdd", function()
	require("java").config_dap()
end, "[J]ava [D]AP [C]onfigure")

-- DAP Standard Keybindings (if DAP is available)
if status_dap then
	-- Breakpoints
	map("n", "<leader>db", function()
		dap.toggle_breakpoint()
	end, "[D]ebug toggle [B]reakpoint")

	map("n", "<leader>dB", function()
		dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end, "[D]ebug conditional [B]reakpoint")

	map("n", "<leader>dlp", function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end, "[D]ebug [L]og [P]oint")

	-- Execution Control
	map("n", "<F5>", function()
		dap.continue()
	end, "Debug: Continue")

	map("n", "<F10>", function()
		dap.step_over()
	end, "Debug: Step Over")

	map("n", "<F11>", function()
		dap.step_into()
	end, "Debug: Step Into")

	map("n", "<F12>", function()
		dap.step_out()
	end, "Debug: Step Out")

	map("n", "<leader>dr", function()
		dap.repl.open()
	end, "[D]ebug [R]EPL")

	map("n", "<leader>dl", function()
		dap.run_last()
	end, "[D]ebug run [L]ast")

	-- DAP UI
	if status_dapui then
		map("n", "<leader>du", function()
			dapui.toggle()
		end, "[D]ebug [U]I toggle")

		map("n", "<leader>de", function()
			dapui.eval()
		end, "[D]ebug [E]val expression")
	end
end

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ REFACTORING OPERATIONS                                                ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("v", "<leader>jrv", function()
	require("java").refactor.extract_variable()
end, "[J]ava [R]efactor extract [V]ariable")

map("v", "<leader>jra", function()
	require("java").refactor.extract_variable_all_occurrence()
end, "[J]ava [R]efactor extract [A]ll occurrences")

map("v", "<leader>jrc", function()
	require("java").refactor.extract_constant()
end, "[J]ava [R]efactor extract [C]onstant")

map("v", "<leader>jrm", function()
	require("java").refactor.extract_method()
end, "[J]ava [R]efactor extract [M]ethod")

map("n", "<leader>jrf", function()
	require("java").refactor.extract_field()
end, "[J]ava [R]efactor extract [F]ield")

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ SPRING BOOT PROJECT CREATION                                          ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
if status_springtime then
	map("n", "<leader>jn", ":Springtime<CR>", "[J]ava [N]ew Spring Boot project")
	map("n", "<leader>ju", ":SpringtimeUpdate<CR>", "[J]ava Spring Boot [U]pdate versions")
end

-- ╔═══════════════════════════════════════════════════════════════════════╗
-- ║ JDK/RUNTIME MANAGEMENT                                                ║
-- ╚═══════════════════════════════════════════════════════════════════════╝
map("n", "<leader>jv", ":JavaSettingsChangeRuntime<CR>", "[J]ava change [V]ersion/runtime")

-- ============================================================================
-- AUTO-COMMANDS
-- ============================================================================

-- Auto-organize imports on save (Java files only)
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.java",
	callback = function()
		-- Organize imports
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports" } },
			apply = true,
		})
		-- Format document
		vim.lsp.buf.format({ async = false })
	end,
	desc = "Auto-organize imports and format Java files on save",
})

-- Set Java-specific indentation (4 spaces for enterprise Java)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true
	end,
	desc = "Set Java indentation to 4 spaces",
})

-- ============================================================================
-- USER COMMANDS (Additional Convenience)
-- ============================================================================

-- Quick command to view Java project structure
vim.api.nvim_create_user_command("JavaProjectInfo", function()
	print("Java project root: " .. vim.fn.getcwd())
	print("JDTLS workspace: " .. vim.fn.stdpath("cache") .. "/jdtls")
end, { desc = "Show Java project information" })

-- Quick command to restart JDTLS
vim.api.nvim_create_user_command("JavaRestart", function()
	vim.cmd("LspRestart jdtls")
end, { desc = "Restart JDTLS language server" })

-- ============================================================================
-- STATUS MESSAGE
-- ============================================================================

-- Silent notification that Java setup is complete
vim.defer_fn(function()
	-- Only show if we're in a Java file
	if vim.bo.filetype == "java" then
		vim.notify("Java development environment loaded", vim.log.levels.INFO)
	end
end, 1000)
