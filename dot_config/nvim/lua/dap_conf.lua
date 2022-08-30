local dap = require('dap')


vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { desc = "toggle debug breakpoint" })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = "continue debug programm executuion" })
vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = "step over" })
vim.keymap.set('n', '<leader>dN', dap.step_into, { desc = "step over" })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = "open debug repl" })
