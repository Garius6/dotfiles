local on_attach = function(_, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>',
    { noremap = true, silent = true, buffer = bufnr, desc = "get information about symbol" })

  vim.keymap.set('n', 'K', vim.lsp.buf.hover,
    { noremap = true, silent = true, buffer = bufnr, desc = "get information about symbol" })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    { noremap = true, silent = true, buffer = bufnr, desc = "get signature help" })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to declaration" })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to definition" })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to impletementation" })
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
    { noremap = true, silent = true, buffer = bufnr, desc = "add folder in workspace" })
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
    { noremap = true, silent = true, buffer = bufnr, desc = "remove folder in workspace" })
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { noremap = true, silent = true, buffer = bufnr, desc = "list folders in workspace" })
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to type definition" })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
    { noremap = true, silent = true, buffer = bufnr, desc = "rename symbol" })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
    { noremap = true, silent = true, buffer = bufnr, desc = "get code action" })
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to reference" })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
    { noremap = true, silent = true, buffer = bufnr, desc = "open diagnostic window" })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to previous diagnostic" })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
    { noremap = true, silent = true, buffer = bufnr, desc = "go to next diagnostic" })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
    { noremap = true, silent = true, buffer = bufnr, desc = "open diagnostic list" })

end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local luasnip = require("luasnip")
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust_analyzer"] = {
      completion = {
        callable = {
          snippets = "none",
        },
        autoimport = {
          enable = true,
        },
        autoself = {
          enable = true,
        },
      },
    },
  },
}

require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


require("flutter-tools").setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
    }
  }
}

require 'lspconfig'.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require 'lspconfig'.ocamllsp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.clojure_lsp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require 'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "htmldjango", "html" }
}

require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
