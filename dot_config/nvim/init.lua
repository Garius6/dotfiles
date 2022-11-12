vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('settings')
require('plugins_list')

require("mason").setup()
require("mason-lspconfig").setup()

require('plugins/conjure')
require('plugins/lsp')
require('plugins/telescope')
require('plugins/statusline')
require('plugins/dap')
require('plugins/bufferline')
require('plugins/nvim_tree')
require('plugins/treesitter')
require('plugins/gitsigns')
require('plugins/hop')
require('keybindings')

require('plugins/gruvbox')

require('Comment').setup()
