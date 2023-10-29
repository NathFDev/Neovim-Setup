return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			filetypes = {
				json = false,
				yaml = false,
				toml = false,
			},
		})
	end,
}
