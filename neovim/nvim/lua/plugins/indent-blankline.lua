return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
        require("ibl").setup {
            exclude = {
                filetypes = {
                    "dashboard", "NvimTree", "alpha", "packer", "help", "lspinfo", "TelescopePrompt", "TelescopeResults", ""
                },
            },
            scope = {
                enabled = false,
            }
        }
    end,
}

