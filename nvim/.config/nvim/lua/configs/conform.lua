local options = {
  formatters_by_ft = {
    lua = { "stylua" },
     css = { "prettier" },
     html = { "prettier" },
     go = { "gofmt"},
    templ = {"templ fmt"},
    bash = { "shfmt" },
    sh = { "shfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
