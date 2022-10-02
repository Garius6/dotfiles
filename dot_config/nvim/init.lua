vim.g.mapleader = ' '

require('settings')
require('plugins_list')
require('plugins/lsp')
require('plugins/telescope')
require('plugins/statusline')
require('plugins/dap')
require('plugins/bufferline')
require('plugins/nvim_tree')
require('plugins/treesitter')
require('plugins/gitsigns')
require('keybindings')

require('onedark').setup {
  style = 'deep'
}
require('onedark').load()


vim.diagnostic.config({
  virtual_text = false,
  float = true
})
