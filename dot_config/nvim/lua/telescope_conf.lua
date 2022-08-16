require('telescope').setup()

vim.keymap.set('n', '<leader>sf', "<cmd>lua require('telescope.builtin').find_files()<cr>")
vim.keymap.set('n', '<leader>sg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set('n', '<leader>sb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set('n', '<leader>st', "<cmd>lua require('telescope.builtin').treesitter()<cr>")
vim.keymap.set('n', '<leader>sd', "<cmd>lua require('telescope.builtin').diagnostics()<cr>")
