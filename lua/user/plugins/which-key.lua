return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        local keymap = vim.keymap

        keymap.set("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Which-key all keymaps" })
        keymap.set("n", "<leader>wk", function()
            local input = vim.fn.input("WhichKey: ")
            vim.cmd("WhichKey " .. input)
        end, { desc = "Which-key query lookup"})
    end,
}
