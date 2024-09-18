-- Load dependencies
require("config.lazy")

-- Set vim config
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "

-- Keybindings
vim.keymap.set("n", "<C-P>", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "<C-l>", require('fzf-lua').live_grep, { desc = "Fzf live_grep" })
vim.keymap.set("n", "<C-g>", require('fzf-lua').grep, { desc = "Fzf grep" })

-- For telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- For Neotree
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>fr', ':Neotree reveal<CR>', {})

-- For LSP-config
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gdd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

-- Theme
-- require('onedark').load()
vim.cmd('colorscheme tokyonight-day')
