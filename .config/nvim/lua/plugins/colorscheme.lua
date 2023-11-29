return {
  -- add rosepine
  { "rose-pine/neovim", name = "rose-pine" },

  -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "rose-pine",
  --   },
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
}
