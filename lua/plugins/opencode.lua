return {
  "nickjvandyke/opencode.nvim",
  init = function()
    vim.g.opencode_opts = {}
  end,
  keys = {
    {
      "<leader>ao",
      function()
        require("opencode").ask("@this: ")
      end,
      mode = { "n", "x" },
      desc = "Ask OpenCode",
    },
    {
      "<leader>aO",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "OpenCode actions",
    },
    {
      "go",
      function()
        return require("opencode").operator("@this")
      end,
      mode = { "n", "x" },
      expr = true,
      desc = "Send range to OpenCode",
    },
    {
      "goo",
      function()
        return require("opencode").operator("@this") .. "_"
      end,
      expr = true,
      desc = "Send line to OpenCode",
    },
  },
}
