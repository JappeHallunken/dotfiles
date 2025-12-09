require "nvchad.options"
vim.opt.foldenable = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 2
vim.opt.scrolloff = 10
vim.opt.statuscolumn = "%s %l %r"
-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
--
vim.filetype.add {
  extension = {
    templ = "templ",
  },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
vim.g.copilot_no_tab_map = true

vim.opt.number = true
vim.opt.relativenumber = true
