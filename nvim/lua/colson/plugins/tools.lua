-- ============================================================================
-- Plugins / Tools - HTTP clients, preview, AI assistants, presence
-- Author: Colson (@colson0x1)
-- Ported 1:1 from lua/colson/packer.lua (Packer -> lazy.nvim, 2026-07-06).
-- ============================================================================

return {
	-- HTTP Client
	{ "BlackLight/nvim-http" },

	-- HTTP REST Client / TEST API
	--[[ {
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for rest.nvim
			-- "j-hui/fidget.nvim", -- For showing request progress messages
			-- "Lua-cURL/Lua-cURLv3", -- Optional: For handling advanced curl requests
			-- "tami5/xml2lua", -- For parsing XML request bodies
			-- "jubnzv/mimetypes", -- For detecting file MIME types in external body files
			-- "miversen33/nvim-nio", -- For async execution in rest.nvim
			"nvim-neotest/nvim-nio", -- Alternative for async execution in rest.nvim
		},
		config = function()
			require("plugin.http-rest-client")
		end,
	} ]]

	-- @ RESTY HTTP REST Client
	{
		"lima1909/resty.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		--[[ config = function()
			require("after.plugin.http-rest-client")
		end, ]]
	},
	-- RESTY Dependency (DISABLED - Missing dependencies)
	-- rest.nvim requires: fidget.nvim, xml2lua, mimetypes, nvim-nio, tree-sitter-http
	-- Use resty.nvim (above) instead for HTTP REST client functionality
	--[[
	{
		"NTBBloodbath/rest.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-neotest/nvim-nio",
			"j-hui/fidget.nvim",
		},
	},
	--]]

	--[[
    @ Install live-server using NODE
	  sudo npm i -g live-server
	  Start server- :LiveServerStart
	  Stop server- :LiveServerStop
  ]]
	--
	{
		"barrett-ruth/live-server.nvim",
		-- UPDATED (2026-07-06): live-server v0.2.0 removed setup(); options
		-- now go through vim.g.live_server BEFORE the plugin loads (hence
		-- `init`, not `config`). `index`/`htmllint` have no v0.2 equivalent.
		init = function()
			vim.g.live_server = {
				port = 3000,
				browser = false, -- Automatically open the browser when starting the server
				debug = false,
			}
		end,
		--[[ Legacy (pre-v0.2.0) configuration, kept for reference:
		config = function()
			require("live-server").setup({
				port = 3000,
				log = false,
				index = "index.html", -- Specify the default index file
				htmllint = false,
				open_browser = false, -- Automatically open the browser when starting the server
			})
		end, ]]
	},

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" }, -- lazy-load on markdown files
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	},

	--[[
	-- Image Preview
  -- Install Chafa in your machine for it to work inside nvim
  -- $ git clone https://github.com/hpjansson/chafa.git
  -- $ cd chafa
  -- $ ./autogen.sh
  -- $ make
  -- $ sudo make install
  --]]
	{
		"princejoogie/chafa.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
	},

	-- Augment
	{
		"augmentcode/augment.vim",
		--[[ config = function()
			-- Load our dedicated Augment configuration
			require("after.plugin.augment")
		end, ]]
	},

	-- Copilot
	{
		"github/copilot.vim",
		--[[ config = function()
			require("after.plugin.copilot")
		end, ]]
	},

	-- Modern Discord Presence with VSCODE Icons
	--[[
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		-- config = function()
		-- 	require("after.plugin.rpcDope")
		-- end,
	},
  ]]
	{ "IogaMaster/neocord" },
	-- { "andweeb/presence.nvim" },

	-- { "derektata/lorem.nvim" },
	--[[ {
		"derektata/lorem.nvim",
		config = function()
			require("lorem").setup({
				sentenceLength = "mixed",
				comma_chance = 0.3,
				max_commas_per_sentence = 2,
			})
		end,
	} ]]
}
