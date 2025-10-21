require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>to", ":tabnew<CR>", { desc = "Open a new tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" })

-- copilot mappings
vim.g.copilot_no_tab_map = true
map(
  "i",
  "<M-g>",
  "copilot#Accept('<CR>')",
  { silent = true, expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" }
)
map("i", "<M-.>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
map("i", "<M-,>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
map("i", "<M-x>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
map("n", "<M-P>", ":Copilot panel<CR>", { desc = "Open Copilot panel" })

vim.g.codeium_disable_bindings = 1

map(
  "i",
  "<M-ö>",
  "<Cmd>call codeium#CycleOrComplete()<CR>",
  {desc = "Windsurf show suggestions and cycle" }
)

map('i', '<M-ä>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")<M-l>
