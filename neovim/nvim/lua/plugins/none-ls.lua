return {
    {
        'nvimtools/none-ls.nvim'
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require('mason-null-ls').setup({
                ensure_installed = { "flake8" },
            })
            local null_ls = require('null-ls')

            -- Configure null-ls with flake8 for Python linting
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.isort,
                },
            })
        end
    }
}
