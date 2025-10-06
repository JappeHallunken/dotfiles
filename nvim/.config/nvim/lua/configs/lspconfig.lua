local nvlsp = require("nvchad.configs.lspconfig")

local defaults = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

local cfg = vim.lsp.config
local enable = vim.lsp.enable

for _, server in ipairs({ "html", "cssls" }) do
  cfg(server, defaults)
  enable(server)
end

cfg("gopls", vim.tbl_deep_extend("force", defaults, {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_dir = vim.fs.root(0, { "go.mod", ".git" }),
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
}))
enable("gopls")

cfg("templ", vim.tbl_deep_extend("force", defaults, {
  cmd = { "templ", "lsp" },
  filetypes = { "html", "templ", "javascript" },
  root_dir = vim.fs.root(0, { "go.mod", ".git" }),
}))
enable("templ")

cfg("tailwindcss", vim.tbl_deep_extend("force", defaults, {
  filetypes = { "templ", "astro" },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        templ = "html",
      },
    },
  },
}))
enable("tailwindcss")

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
