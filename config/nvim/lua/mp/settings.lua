-- lua/mp/settings.lua
local options = {
    autoindent = true, -- Copy indent from current line when starting a new line.
    colorcolumn = "80",
    cursorline = true, -- Highlight the screen line of the cursor with CursorLine.
    --    clipboard = "unnamedplus", -- uses the clipboard register for all operations except yank.
    encoding = "UTF-8", -- Sets the character encoding used inside Vim.
    expandtab = true, -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
    hidden = true, -- When on a buffer becomes hidden when it is |abandon|ed
    hlsearch = true, -- highlight search
    incsearch = true,
    inccommand = "split", -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
    mouse = "a", -- Enable the use of the mouse. "a" you can use on all modes
    number = true, -- Print the line number in front of each line
    relativenumber = true, -- Show the line number relative to the line with the cursor in front of each line.
    ruler = true, -- Show the line and column number of the cursor position, separated by a comma.
    scrolloff = 8,
    shiftwidth = 4, -- Number of spaces to use for each step of (auto)indent.
    showcmd = true, -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
    showmatch = true, -- When a bracket is inserted, briefly jump to the matching one.
    spelllang = "en_gb",
    splitright = true,
    splitbelow = true, -- When on, splitting a window will put the new window below the current one
    swapfile = false,
    syntax = "on", -- When this option is set, the syntax with this name is loaded.
    tabstop = 4, -- Number of spaces that a <Tab> in the file counts for.
    termguicolors = true,
    title = true, -- When on, the title of the window will be set to the value of 'titlestring'
    ttimeoutlen = 0, -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
    wildmenu = true, -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
    winborder = "rounded",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.neovide_cursor_animation_length = 0
