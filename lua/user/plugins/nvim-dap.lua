return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function(_, _)
		local keymap = vim.keymap

		keymap("n", "<leader>toi", "<cmd> TSLspOrganize <CR>", { desc = "Organize imports" })
		keymap("n", "<leader>tia", "<cmd> TSLspImportAll <CR>", { desc = "Import all" })

		keymap("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
		keymap("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })
		keymap("n", "<leader>dus", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open debugging sidebar" })

		keymap("n", "<leader>dgt", function()
			require("dap-go").debug_test()
		end, { desc = "Debug go test", plugin = true })
		keymap("n", "<leader>dgl", function()
			require("dap-go").debug_last()
		end, { desc = "Debug last go test", plugin = true })

		keymap("n", "<leader>dpr", function()
			require("dap-python").test_method()
		end, { desc = "Run python test method", plugin = true })

		keymap("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags", plugin = true })
		keymap("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags", plugin = true })

		keymap("n", "<leader>rcu", function()
			require("crates").upgrade_all_crates()
		end, { desc = "update crates" })

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
