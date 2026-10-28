return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        function()
          return LazyVim.cmp.map({ "ai_accept" })()
        end,
        function(cmp)
          local col = vim.api.nvim_win_get_cursor(0)[2]
          local line = vim.api.nvim_get_current_line()
          if col > 0 and not line:sub(col, col):match("%s") then
            return cmp.show()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
  },
}
