vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })

-- go to beginning and end
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- navigate within insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- clear highlights
keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- switch between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Buffer Navigation
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page and center the cursor" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page and center the cursor" })
keymap.set("n", "n", "nzzzv", { desc = "Move to the next search result and center the cursor" })
keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous search result and center the cursor" })
keymap.set('n', '<leader>x', ':bd<CR>', { desc = "Close buffer" })

-- Yank to system clipboard
keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Search and replace word under cursor
keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search and replace word under cursor" }
)

-- Source current file
keymap.set("n", "<leader><leader>", ":so<CR>", { desc = "Source current file" })

-- Save
keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save file" })

-- Copy all
keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

-- New buffer
keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "New buffer" })

-- Formatting
keymap.set("n", "<leader>fm", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "LSP formatting" })

-- Exit terminal mode
keymap.set(
    "t",
    "<C-x>",
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
    { desc = "Escape terminal mode" }
)

-- Move the current line / block
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Indent
keymap.set("v", "<", "<gv", { desc = "Indent line" })
keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Yan to system clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })

-- DAP
keymap.set("n", "<leader>toi", "<cmd> TSLspOrganize <CR>", { desc = "Organize imports" })
keymap.set("n", "<leader>tia", "<cmd> TSLspImportAll <CR>", { desc = "Import all" })

keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })
keymap.set("n", "<leader>dus", function()
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
end, { desc = "Open debugging sidebar" })

keymap.set("n", "<leader>dgt", function()
    require("dap-go").debug_test()
end, { desc = "Debug go test" })
keymap.set("n", "<leader>dgl", function()
    require("dap-go").debug_last()
end, { desc = "Debug last go test" })

keymap.set("n", "<leader>dpr", function()
    require("dap-python").test_method()
end, { desc = "Run python test method" })

keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
keymap.set("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })

keymap.set("n", "<leader>rcu", function()
    require("crates").upgrade_all_crates()
end, { desc = "update crates" })
