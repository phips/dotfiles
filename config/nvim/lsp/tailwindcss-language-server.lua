-- tailwindcss-language-server.lua
return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "gohtml", "gohtmltmpl", "html", "css", "postcss", "sass", "scss" },
    root_markers = { "hugo.yaml", "hugo.toml", "theme.toml" },
    -- settings = {
    --     "tailwindCSS.experimental.configFile" = "assets/css/main.css"
    -- },
}
