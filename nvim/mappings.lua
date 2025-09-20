require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>to", ":tabnew<CR>", { desc = "Open a new tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })

-- copilot mappings
map("i", "<M-g>", "copilot#Accept('<CR>')", { silent = true, expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })
map("i", "<M-.>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
map("i", "<M-,>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
map("i", "<M-x>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
map("n", "<M-P>", ":Copilot panel<CR>", { desc = "Open Copilot panel" })




-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
