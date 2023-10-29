return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"typescript-language-server",
				"html-lsp",
				"htmx-lsp",
				"css-lsp",
				"tailwindcss-language-server",
				"svelte-language-server",
				"lua-language-server",
				"graphql-language-service-cli",
				"json-lsp",
				"emmet-language-server",
				"vue-language-server",
				"astro-language-server",
				"custom-element-languageserver",
				"dockerfile-language-server",
				"pyright",
				"gopls",
				"rust-analyzer",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
