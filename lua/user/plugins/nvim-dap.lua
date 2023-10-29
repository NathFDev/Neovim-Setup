return {
	"mfussenegger/nvim-dap",
    lazy = true,
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local keymap = vim.keymap

		local mason_dap = require("mason-nvim-dap")

		mason_dap.setup({
			ensure_installed = {
				"js-debug-adapter",
				"delve",
			},
		})

		local dap = require("dap")

		dap.adapters["pwa.node"] = {
			type = "server",
			host = "127.0.0.1",
			port = 8123,
			executable = {
				command = "js-debug-adapter",
			},
		}

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
				},
			}
		end
	end,
}
