require("mason").setup()

require("mason-tool-installer").setup({
    ensure_installed = {
        "terraform-ls",
        "ansible-language-server",
        "tailwindcss-language-server",
        "terraform",
        "tflint",
        "ansible-lint",
        "jsonlint",
    },
})
