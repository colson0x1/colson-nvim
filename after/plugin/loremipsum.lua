local status, loremipsum = pcall(require, "lorem")
if not status then
	return
end

loremipsum.setup({
	sentenceLength = "mixedShort",
	comma = 0.1,
})
