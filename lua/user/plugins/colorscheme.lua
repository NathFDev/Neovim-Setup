return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			term_colors = true,
			integrations = {
				harpoon = true,
				mason = true,
				which_key = true,
			},
		})
	end,
}
