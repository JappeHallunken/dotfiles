-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "gopls" then
    -- Custom config for gopls
    lspconfig.gopls.setup {
      cmd = { "gopls" },
      filetypes = { "go", "gomod" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git"),  -- Set root dir to go.mod or .git
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,  -- Enable unusedparams analysis
          },
          staticcheck = true,  -- Enable staticcheck linting
          gofumpt = true,  -- Enable gofumpt formatting
        },
      },
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  else

  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
