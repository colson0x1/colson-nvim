-- @ Enterprise-grade configuration for RESTY HTTP REST Client.
-- Tailored for large-scale web application microservices

-- Ensure the leader key is set before mapping any keys.
vim.g.mapleader = vim.g.mapleader or " "

local ok, resty = pcall(require, "resty")
if not ok then
	-- vim.notify("resty.nvim not found", vim.log.levels.ERROR)
	return
end

-- Retrieve environment-based defaults (set these in your shell or CI/CD environment)
local env_file = os.getenv("RESTY_ENV_FILE") or ".env"
local default_timeout = tonumber(os.getenv("RESTY_TIMEOUT")) or 1500

resty.setup({
	result_split_horizontal = false,
	result_split_in_place = true,
	skip_ssl_verification = (os.getenv("RESTY_SKIP_SSL") == "true") or false,
	encode_url = true,
	highlight = {
		enabled = true,
		timeout = 1000,
	},
	log_level = vim.log.levels.DEBUG,
	result = {
		show_url = true,
		show_curl_command = false,
		show_http_info = true,
		show_headers = true,
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	env_file = env_file,
	custom_dynamic_variables = {
		["service_endpoint"] = function()
			return os.getenv("SERVICE_ENDPOINT") or "https://api.enterprise.example.com"
		end,
		["auth_token"] = function()
			return os.getenv("AUTH_TOKEN") or ""
		end,
		["db_url"] = function()
			return os.getenv("DATABASE_URL") or "postgres://user:password@localhost:5432/dbname"
		end,
	},
	cfg = {
		timeout = default_timeout,
		proxy = os.getenv("RESTY_PROXY") or "",
		check_json_body = true,
	},
	yank_dry_run = false,
})

-- Load Telescope extension if available.
local hasTelescope, telescope = pcall(require, "telescope")
if hasTelescope then
	-- Check if the rest extension exists before trying to load it
	local has_rest_extension = pcall(require, "telescope._extensions.rest")
	if has_rest_extension then
		telescope.load_extension("rest")
	else
		vim.notify("Telescope REST extension not found. Please install it first.", vim.log.levels.WARN)
	end
end

-- -- Schedule key mappings to ensure they are set after all plugins load.
-- vim.schedule(function()
-- 	local km = vim.keymap.set
-- 	-- Non-conflicting remaps using <leader>ap prefix.
-- 	km("n", "<leader>api", "<cmd>Resty run<CR>", { noremap = true, silent = true, desc = "[R]esty run request" })
-- 	km("n", "<leader>apo", "<cmd>Resty open<CR>", { noremap = true, silent = true, desc = "[R]esty open result pane" })
-- 	km("n", "<leader>apl", "<cmd>Resty last<CR>", { noremap = true, silent = true, desc = "[R]esty run last request" })
-- 	km(
-- 		"n",
-- 		"<leader>apf",
-- 		"<cmd>Resty favorite<CR>",
-- 		{ noremap = true, silent = true, desc = "[R]esty show favorites" }
-- 	)
-- 	km(
-- 		"n",
-- 		"<leader>apm",
-- 		"<cmd>Resty favorite my favorite<CR>",
-- 		{ noremap = true, silent = true, desc = "[R]esty run favorite 'my favorite'" }
-- 	)
-- 	km("n", "<leader>aplgs", "<cmd>Resty logs<CR>", { noremap = true, silent = true, desc = "[R]esty edit logs file" })
-- 	km(
-- 		"n",
-- 		"<leader>aprc",
-- 		"<cmd>Resty cookies<CR>",
-- 		{ noremap = true, silent = true, desc = "[R]esty edit cookies file" }
-- 	)
-- 	km(
-- 		"n",
-- 		"<leader>apre",
-- 		"<cmd>Resty env show<CR>",
-- 		{ noremap = true, silent = true, desc = "[R]esty show env file" }
-- 	)
-- 	km(
-- 		"n",
-- 		"<leader>aprs",
-- 		"<cmd>Resty env select<CR>",
-- 		{ noremap = true, silent = true, desc = "[R]esty select env file" }
-- 	)
-- 	km(
-- 		"n",
-- 		"<leader>aprt",
-- 		"<cmd>Resty env set ",
-- 		{ noremap = true, silent = true, desc = "[R]esty set env file (append path)" }
-- 	)
-- end)
--
-- -- Define user commands for documented operations.
-- vim.cmd([[
--   command! -nargs=? RestyRun execute "Resty run" <q-args>
--   command! -nargs=0 RestyLast execute "Resty last"
--   command! -nargs=0 RestyFavorite execute "Resty favorite"
--   command! -nargs=1 RestyFavoriteRun execute "Resty favorite " . <q-args>
--   command! -nargs=0 RestyOpen execute "Resty open"
--   command! -nargs=0 RestyLogs execute "Resty logs"
--   command! -nargs=0 RestyCookies execute "Resty cookies"
--   command! -nargs=0 RestyEnvShow execute "Resty env show"
--   command! -nargs=0 RestyEnvSelect execute "Resty env select"
--   command! -nargs=1 RestyEnvSet execute "Resty env set " . <q-args>
-- ]])
