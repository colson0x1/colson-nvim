local status, react_snippets = pcall(require, "react_snippets")
if not status then
	return
end

react_snippets.setup({})
