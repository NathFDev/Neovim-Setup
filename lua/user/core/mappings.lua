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
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
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

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", opts = { expr = true } })
keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", opts = { expr = true } })
keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", opts = { expr = true } })
keymap.set(
	"n",
	"<Down>",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ desc = "Move down", opts = { expr = true } }
)

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
keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", opts = { expr = true } })
keymap.set(
	"v",
	"<Down>",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ desc = "Move down", opts = { expr = true } }
)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Indent
keymap.set("v", "<", "<gv", { desc = "Indent line" })
keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Yan to system clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })

-- Others?
keymap.set("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", opts = { expr = true } })
keymap.set("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", opts = { expr = true } })
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text", opts = { silent = true } })
