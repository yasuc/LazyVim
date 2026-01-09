if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway
  opts = {
    experimental = {
      check_rtp_message = false,
      -- check_rtp = false, -- チェック自体を止める場合
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>um",
      ft = "markdown",
      "<cmd>Markview splitToggle<cr>",
      desc = "Markview Split Toggle",
    },
  },
}
