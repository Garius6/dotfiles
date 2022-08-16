vim.g.mapleader = ' '

require('plugins')
require('lsp_conf')
require('telescope_conf')
require('statusline_conf')

require 'nvim-treesitter.configs'.setup {
  indent = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = "return terminal to normal mode" })

vim.keymap.set('n', '<leader>tc', ':tabnew<CR>', { desc = "create new tab" })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = "go to next tab" })
vim.keymap.set('n', '<leader>tb', ':tabprevious<CR>', { desc = "go previous tab" })
vim.keymap.set('n', '<leader>td', ':tabclose<CR>', { desc = "close tab" })
vim.keymap.set('n', '<leader>tl', ':tabs<CR>', { desc = "print tabs list" })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "go to next buffer" })
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>', { desc = "go to previous buffer" })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = "print buffers list" })

vim.keymap.set('n', '<leader>T', ':ToggleTerm<CR>', { desc = "toggle terminal" })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true

vim.diagnostic.config({
  virtual_text = false,
  float = true
})

require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    changedelete = { text = '~' },
  }
}

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  transparent_background = true,
})

local function _gitui_toggle()
  local Terminal = require('toggleterm.terminal').Terminal
  local gitui    = Terminal:new({
    cmd = "gitui",
    hidden = true,
    close_on_exit = false,
    dir = vim.fn.expand("%:h"),
    direction = "float",
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
  })

  gitui:toggle()
end

vim.keymap.set("n", "<leader>Ta", _gitui_toggle, { desc = "open gitui" })

vim.cmd [[colorscheme catppuccin]]
