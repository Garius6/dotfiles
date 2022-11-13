require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "sumneko_lua"
  }
})

require("mason-null-ls").setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "black", -- python
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
