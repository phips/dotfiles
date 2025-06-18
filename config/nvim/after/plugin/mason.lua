require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "terraformls",
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "ansible-language-server",
        "tailwindcss-language-server",
        "terraform",
        "tflint",
        "ansible-lint",
        "jsonlint",
    },
})
