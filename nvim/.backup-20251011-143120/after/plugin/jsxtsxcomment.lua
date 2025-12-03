local status, jsxtsxcomment = pcall(require, "ts_context_commentstring")
if not status then
	return
end

jsxtsxcomment.setup({
	enable_autocmd = false,
})
