local status, rest = pcall(require, "rest-nvim")
if not status then
	return
end

rest.setup({
	result_split_horizontal = false, -- Use vertical split for results, better for wide responses
	skip_ssl_verification = false, -- Ensure SSL is verified, useful in production environments
	encode_url = true, -- Automatically encode URLs to ensure proper formatting
	env_file = ".env", -- Load environment variables from a .env file
	custom_dynamic_variables = {}, -- Add your dynamic variable handling here
	highlight = {
		enabled = true,
		timeout = 250, -- Longer timeout for better visual response feedback
	},
	result = {
		show_url = true, -- Show URL of the request
		show_http_info = true, -- Display status codes and HTTP version
		show_headers = true, -- Display response headers for debugging
		formatters = { "json", "html" }, -- Format JSON and HTML responses neatly
	},
	jump_to_request = true, -- Automatically jump to the request upon execution
	yank_dry_run = true, -- Enable yank dry run for quick copy-paste actions in response data
})

-- Old configuration
--[[ rest.setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- stay in current windows (.http file) or change to results window (default)
	stay_in_current_window_after_split = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Encode URL before making request
	encode_url = true,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		-- show the generated curl command in case you want to launch
		-- the same request via the terminal (can be verbose)
		show_curl_command = false,
		show_http_info = true,
		show_headers = true,
		-- table of curl `--write-out` variables or false if disabled
		-- for more granular control see Statistics Spec
		show_statistics = false,
		-- executables or functions for formatting response body [optional]
		-- set them to false if you want to disable them
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
	search_back = true,
}) ]]
