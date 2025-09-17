require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local nvlsp = require("nvchad.configs.lspconfig")

local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

lspconfig.gopls.setup({
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			-- Remove gofumpt = true from here. Handle it in null-ls.
		},
	},
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
})

lspconfig.templ.setup({
	cmd = { "templ", "lsp" },
	filetypes = { "templ" },
	root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
	on_attach = nvlsp.on_attach,
	on_init = nvlsp.on_init,
	capabilities = nvlsp.capabilities,
	filetypes = { "html", "templ", "javascript" },
})

lspconfig.tailwindcss.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "templ", "astro" },
	settings = {
		tailwindCSS = {
			includeLanguages = {
				templ = "html",
			},
		},
	},
})
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
