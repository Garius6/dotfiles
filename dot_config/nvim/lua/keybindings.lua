local wk = require('which-key')

-- General
vim.keymap.set('n', '<leader>R', ':source $MYVIMRC<CR>')

-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = "return terminal to normal mode" })
vim.keymap.set('n', '<leader>T', ':ToggleTerm<CR>', { desc = "toggle terminal" })

-- Buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "go to next buffer" })
vim.keymap.set('n', '<leader>bb', ':bprevious<CR>', { desc = "go to previous buffer" })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = "print buffers list" })
vim.keymap.set('n', '<leader>bk', ':bdelete<CR>', { desc = "kill buffer" })

-- Telescope
wk.register({
  name = "Telescope",
  f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
  l = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
  b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "find buffers" },
  t = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "find treesitter" },
  d = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "find diagnostics" },
}, { prefix = "<leader>s" })

-- Tabs and Tree
wk.register({
  t = {
    name = "Tabs",
    c = { ':tabnew<CR>', "create new tab" },
    n = { ':tabnext<CR>', "go to next tab" },
    b = { ':tabprevious<CR>', "go previous tab" },
    d = { ':tabclose<CR>', "close tab" },
    l = { ':tabs<CR>', "print tabs list" }
  },
  r = {
    name = "NvimTree",
    t = { ":NvimTreeToggle<CR>", "toggle tree" },
    f = { ":NvimTreeFocus<CR>", "focus tree" }
  }
}, { prefix = "<leader>t" })

-- Hop
vim.keymap.set('n', '<leader>hc', '<cmd>HopChar2<cr>')
vim.keymap.set('n', '<leader>hl', '<cmd>HopLineStart<cr>')
vim.keymap.set('n', '<leader>hp', '<cmd>HopPattern<cr>')
vim.keymap.set('n', '<leader>hw', '<cmd>HopWord<cr>')
