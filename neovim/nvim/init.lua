-- Set vim config (these settings can be shared)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.g.mapleader = " "

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
    vim.keymap.set("n", "<leader>gr", require('fzf-lua').lsp_references, { desc = "Fzf LSP references" })

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
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', 'gtr', vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, {})
    vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
    vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)


	vim.cmd('colorscheme catppuccin-frappe')
else
    -- This is in VSCODE
end

