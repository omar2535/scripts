-- Set vim config (these settings can be shared)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.guicursor = "a:blinkon100"

-- Make my config a bit more like normal text editors by allowing me to use the arrow keys to move around
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true, silent = true })

-- For dynamic line numbers (I don't really use this since I have a git statusline which conflicts with this)
-- vim.opt.relativenumber = true
-- vim.opt.signcolumn = "number"

-- Theme (you might need to adjust this if the colorscheme doesn't load properly in VSCode)

if not vim.g.vscode then
    -- Load dependencies
    require("config.lazy")

    -- Set up notify
    vim.notify = require('notify')

    -- Set up better whitespace
    vim.g.better_whitespace_enabled = 1
    vim.g.show_training_whitespace = 0
    vim.g.strip_whitespace_on_save = 1
    vim.g.better_whitespace_ctermcolor = 'NONE'
    vim.g.better_whitespace_guicolor = 'NONE'


    -- For fzf-lua
    vim.keymap.set("n", "<C-P>", require('fzf-lua').files, { desc = "Fzf Files" })
    vim.keymap.set("n", "<C-l>", require('fzf-lua').live_grep, { desc = "Fzf live_grep" })
    vim.keymap.set("n", "<C-g>", require('fzf-lua').grep, { desc = "Fzf grep" })
    vim.keymap.set("n", "<C-\\>", require('fzf-lua').buffers, { desc = "Fzf buffer" })

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
    vim.keymap.set("n", "<leader>gr", require('fzf-lua').lsp_references, { desc = "Fzf LSP references" })
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, {})
    -- Reminder: There's one more keymap: <leader>rn for renaming a symbol with live preview
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)


	vim.cmd('colorscheme catppuccin-frappe')
    -- vim.cmd('colorscheme catppuccin-latte')
else
    -- This is in VSCODE
end

