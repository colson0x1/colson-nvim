------------------------------------------------------------
-- Markdown Preview Plugin Configuration
--
-- This configuration file sets global options for
-- markdown-preview.nvim and defines key mappings for
-- starting, stopping, and toggling the Markdown preview.
--
-- The plugin lazy-loads based on command invocations,
-- hence these mappings are available across all buffers.
------------------------------------------------------------

-- Global Settings for markdown-preview.nvim.
vim.g.mkdp_auto_close = 0 -- Do not close the preview window when exiting Vim.
vim.g.mkdp_auto_start = 1 -- Automatically start preview when a Markdown file is opened.
vim.g.mkdp_open_to_the_world = 1 -- Allow external access to the preview server.
vim.g.mkdp_port = "8080" -- Specify the port for the preview server.
vim.g.mkdp_refresh_slow = 0 -- Use a fast refresh rate.
vim.g.mkdp_filetypes = { "markdown" } -- Activate plugin for Markdown files only.
