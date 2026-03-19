-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.emmet-ms")
require("config.browser")
require("config.neovide_config")

require("tokyonight").setup({
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
  on_colors = function() end,
  on_highlights = function() end,
})
vim.cmd([[colorscheme tokyonight-night]])
