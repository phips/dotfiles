return {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    cond = function()
        return vim.loop.os_uname().sysname ~= "FreeBSD"
    end,
    opts = {}, -- lazy.nvim will implicitly call setup
}
