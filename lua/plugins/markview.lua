if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = false,
      },
    })
  end,

  keys = {
    {
      "<leader>um",
      ft = "markdown",
      "<cmd>Markview splitToggle<cr>",
      desc = "Markview Split Toggle",
    },
  },
}
