return {
    -- {
    --     "toupeira/vim-desertink",
    --     config = function()
    --         vim.cmd("colorscheme desertink")
    --     end
    -- },
    { "toupeira/vim-desertink", lazy = false,        priority = 1000 }, -- default
    { "folke/tokyonight.nvim",  name = "tokyonight", lazy = true },
    { "rebelot/kanagawa.nvim",  name = "kanagawa",   lazy = true },
    { "catppuccin/nvim",        name = "catppuccin", lazy = true },
    { "rose-pine/neovim",       name = "rose-pine",  lazy = true },
    { "sainnhe/everforest",     name = "everforest", lazy = false },
    { "navarasu/onedark.nvim",  name = "onedark",    lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- opts = { theme = "desertink" },
}
