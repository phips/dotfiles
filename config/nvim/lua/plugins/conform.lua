return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local function get_stylua_path()
            if vim.fn.has("mac") == 1 then
                return "/opt/homebrew/bin/stylua"
            elseif vim.fn.has("bsd") == 1 then
                return "/usr/local/bin/stylua"
            else
                return "stylua" -- fallback to PATH
            end
        end
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                css = { "prettier" },
                go = { "gofmt" },
                html = { "prettier" },
                json = { "jq" },
                markdown = { "prettier" },
                nginx = { "nginxfmt" },
                lua = { "stylua" },
                python = { "isort", "black" },
                yaml = { "yamlfmt" },
                toml = { "tombi" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
            formatters = {
                stylua = {
                    inherit = false,
                    command = get_stylua_path(),
                    args = { "--indent-type", "Spaces", "--stdin-filepath", "$FILENAME", "-" },
                },
            },
        })
    end,
}
