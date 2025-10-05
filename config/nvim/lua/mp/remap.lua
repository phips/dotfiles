-- lua/mp/remap.lua
local global = vim.g
local map = vim.keymap.set

-- Editor options
global.mapleader = " "
global.maplocalleader = "\\"

map("n", "<leader>fn", vim.cmd.Ex, { desc = "Explore" })
map("n", "<leader>i", vim.diagnostic.open_float, { desc = "LSP diagnostic" })
map("n", "<leader>L", vim.cmd.Lazy, { desc = "[L]azy" })
map("n", "<leader>w", "<Cmd>update<CR>", { desc = "[W]rite" })

map("n", "grf", ":read <cfile><CR>", { desc = "Read file under cursor" })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

if global.neovide then
    map("n", "<D-s>", ":w<CR>") -- Save
    map("v", "<D-c>", '"+y') -- Copy
    map("n", "<D-v>", '"+P') -- Paste normal mode
    map("v", "<D-v>", '"+P') -- Paste visual mode
    map("c", "<D-v>", "<C-R>+") -- Paste command mode
    map("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

-- write to root owned files
map("c", "w!!", "w !doas tee > /dev/null %", { silent = true, desc = "Doas root write" })

-- correct spelling :set spell
map("n", "<leader>c", "1z=", { desc = "Take first suggested spelling correction" })
