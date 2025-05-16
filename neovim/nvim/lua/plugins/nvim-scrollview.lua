return {
    'dstein64/nvim-scrollview',
    config = function()
        require('scrollview').setup({
             excluded_filetypes = {'nerdtree'},
             current_only = true,
             base = 'right',
             signs_on_startup = {'all'},
             diagnostics_severities = {vim.diagnostic.severity.ERROR}
        })
    end
}
