local function resolve_js_import()
  local file = vim.fn.expand("<cfile>")
  print("GF TARGET:", file)

  if not file:match("^%.%./") and not file:match("^%./") then
    return false
  end

  local base = vim.fn.expand("%:p:h")
  local target = vim.fs.normalize(base .. "/" .. file)

  local extensions = { "", ".js", ".jsx", ".ts", ".tsx" }

  for _, ext in ipairs(extensions) do
    local candidate = target .. ext

    if vim.fn.filereadable(candidate) == 1 then
      vim.cmd.edit(vim.fn.fnameescape(candidate))
      return true
    end

    for _, index_ext in ipairs({ "js", "jsx", "ts", "tsx" }) do
      candidate = target .. ext .. "/index." .. index_ext

      if vim.fn.filereadable(candidate) == 1 then
        vim.cmd.edit(vim.fn.fnameescape(candidate))
        return true
      end
    end
  end

  return false
end

vim.keymap.set("n", "gf", function()
  if vim.bo.filetype == "javascript"
    or vim.bo.filetype == "javascriptreact"
    or vim.bo.filetype == "typescript"
    or vim.bo.filetype == "typescriptreact" then
    if resolve_js_import() then
      return
    end
  end

  vim.cmd.normal({ "gf", bang = true })
end, { desc = "Go to file (JS imports supported)" })

