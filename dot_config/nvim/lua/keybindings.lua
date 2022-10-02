-- General
vim.keymap.set('n', '<leader>R', ':source $MYVIMRC<CR>')

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = "return terminal to normal mode" })
vim.keymap.set('n', '<leader>T', ':ToggleTerm<CR>', { desc = "toggle terminal" })

-- Tabs
vim.keymap.set('n', '<leader>ttc', ':tabnew<CR>', { desc = "create new tab" })
vim.keymap.set('n', '<leader>ttn', ':tabnext<CR>', { desc = "go to next tab" })
vim.keymap.set('n', '<leader>ttb', ':tabprevious<CR>', { desc = "go previous tab" })
vim.keymap.set('n', '<leader>ttd', ':tabclose<CR>', { desc = "close tab" })
vim.keymap.set('n', '<leader>ttl', ':tabs<CR>', { desc = "print tabs list" })

-- NvimTree
vim.keymap.set('n', '<leader>trt', ":NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>trf', ":NvimTreeFocus<CR>")

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "go to next buffer" })
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>', { desc = "go to previous buffer" })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = "print buffers list" })
