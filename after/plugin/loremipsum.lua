local status, loremipsum = pcall(require, "lorem")
if not status then
	return
end

--[[ loremipsum.setup({
	sentenceLength = "mixedShort",
	comma = 0.1,
}) ]]

-- Check if setup function exists
--[[ if type(loremipsum.setup) == "function" then
	loremipsum.setup({
		sentenceLength = "mixedShort",
		comma = 0.1,
	})
else ]]
-- Handle the case where setup does not exist
-- print("loremipsum.setup function not found. Check the plugin documentation for proper usage.")
-- end
