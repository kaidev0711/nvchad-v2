local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Go
  -- b.formatting.goimports,
  -- b.formatting.gofmt,
  b.formatting.gofumpt,
  b.formatting.golines,
  -- b.diagnostics.revive,

  --python
  b.diagnostics.flake8,
  b.formatting.black,

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
