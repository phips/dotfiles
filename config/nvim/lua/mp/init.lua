-- lua/mp/init.lua
-- print(vim.loop.os_uname().sysname)
require("mp.remap")
require("mp.settings")
require("mp.lazy")

-- Check if running Neovim 0.11 or greater
local version = vim.version()
local is_neovim_0_11_plus = (version.major > 0 or (version.major == 0 and version.minor >= 11))

-- Only include the new LSP configuration if on Neovim 0.11+
if is_neovim_0_11_plus then
    vim.lsp.enable({ "ansible-language-server", "tailwindcss-language-server" })
end
