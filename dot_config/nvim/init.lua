vim.g.mapleader = ' '

require('plugins')
require('lspconf')
require('telescope_conf')
require('statusline_conf')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.opt.autoindent = true

vim.opt.cursorline = true

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2

vim.opt.softtabstop = 2

vim.opt.expandtab = true

vim.opt.number = true

vim.opt.autoindent = true

vim.opt.smartindent = true
