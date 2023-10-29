return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			diagnostics = "nvim_lsp",
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		local keymap = vim.keymap

		keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to Next buffer" })
		keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to Next buffer" })
	end,
}
