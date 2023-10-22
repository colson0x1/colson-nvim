--[[
local status, jetbrains_ide = pcall(require, "darcula")
if not status then
	return
end

jetbrains_ide.setup()

vim.cmd("colorscheme darcula")
]]
--
