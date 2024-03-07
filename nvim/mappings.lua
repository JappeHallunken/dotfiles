---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
     -- Add a new mapping for LSP format
        ["<leader>f"] = {
            function()
                vim.lsp.buf.format()
            end,
            "LSP format",
        }
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!
M.codeium = {
     i = {
     ["<C-ä>"] = {function () return vim.fn['codeium#Accept']() end, opts = { expr = true, silent = true }},
     ["<C-,>"] = {function () return vim.fn['codeium#CycleCompletions'](1) end, opts = { expr = true, silent = true }},
     ["<C-.>"] = {function () return vim.fn['codeium#CycleCompletions'](-1) end, opts = { expr = true, silent = true }},
     ["<C-ö>"] = {function () return vim.fn['codeium#Clear']() end, opts = { expr = true, silent = true }},
     ["<C-l>"] = {function () return vim.fn['codeium#Complete']() end, opts = { expr = true, silent = true }},
     },
}




return M
