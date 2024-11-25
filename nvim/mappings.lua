require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>to", ":tabnew<CR>", { desc = "Open a new tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
