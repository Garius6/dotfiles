vim.g.mapleader = ' '

require('plugins')
require('lsp_conf')
require('telescope_conf')
require('statusline_conf')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader>tc', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<leader>tb', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>td', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tl', ':tabs<CR>')

vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>')
vim.keymap.set('n', '<leader>bl', ':buffers<CR>')

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.opt.autoindent = true

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2

vim.opt.softtabstop = 2

vim.opt.expandtab = true

vim.opt.number = true

vim.opt.autoindent = true

vim.opt.smartindent = true

vim.diagnostic.config({
  virtual_text = false,
  float = true
})

