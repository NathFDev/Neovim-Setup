return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	dependencies = "neovim/nvim-lspconfig",
	config = function()
		require("rust-tools").setup({
			server = {
				on_attach = function(_, bufnr)
					local keymap = vim.keymap
					-- Hover actions
					keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end,
}
