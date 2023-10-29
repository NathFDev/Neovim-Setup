return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")

		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx and jsx files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})

		-- Mappings
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<C-/>",
			"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
			{ desc = "Toggle comment" }
		)
		keymap.set(
			"v",
			"<C-/>",
			"<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			{ desc = "Toggle comment" }
		)
	end,
}
