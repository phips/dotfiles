require("mason").setup()

vim.keymap.set("n", "<leader>m", vim.cmd.Mason, { desc = "Mason" })

-- require("mason-lspconfig").setup({
--     ensure_installed = {
--         "terraformls",
--     },
-- })

local ensure_installed = {
    "ansible-language-server",
    "tailwindcss-language-server",
    "ansible-lint",
    "jsonlint",
}

-- Add terraform tools only if not on FreeBSD
if vim.fn.has("bsd") == 0 then
    table.insert(ensure_installed, "terraform")
    table.insert(ensure_installed, "tflint")
end

require("mason-tool-installer").setup({
    ensure_installed = ensure_installed,
})
