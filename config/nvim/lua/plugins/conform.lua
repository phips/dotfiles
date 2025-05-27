return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                yaml = { "yamlfmt" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            formatters = {
                stylua = {
                    inherit = false,
                    command = "/opt/homebrew/bin/stylua",
                    args = { "--indent-type", "Spaces", "--stdin-filepath", "$FILENAME", "-" },
                },
            },
        })
    end,
}
