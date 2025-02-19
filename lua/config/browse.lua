local	browser = require('browse')

local bookmarks = {
	["c++"] = {
		["cplusplus_search"] = "https://cplusplus.com/search.do?q=%s",
		["c++ online compiler"] = "https://www.onlinegdb.com/online_c++_compiler",
	},
	["github link"] = {
		["BenjaminRap"] = "https://github.com/BenjaminRap",
	},
	["github search"] = {
		["name"] = "search github from neovim",
		["code_search"] = "https://github.com/search?q=%s&type=code",
		["repo_search"] = "https://github.com/search?q=%s&type=repositories",
		["issues_search"] = "https://github.com/search?q=%s&type=issues",
		["pulls_search"] = "https://github.com/search?q=%s&type=pullrequests",
	},
}

vim.keymap.set("n", "<leader>gb", function()
	browser.open_bookmarks({ bookmarks = bookmarks })
end)
vim.keymap.set("n", "<leader>gi", function()
	browser.input_search()
end)
