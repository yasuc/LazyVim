return {
  "rest-nvim/rest.nvim",
  ft = "http",
  cmd = "Rest",
  keys = {
    { "<leader>r", "", desc = "+RestNvim" },
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run request under the cursor" },
    { "<leader>rl", "<cmd>Rest run last<cr>", desc = "Re-run latest request" },
    { "<leader>re", "<cmd>Telescope rest select_env<cr>", desc = "Select environment variables file" },
    { "<Leader>rn", ":Rest run<space>", desc = "Run request name" },
    { "<Leader>rhn", ":hor Rest run<space>", desc = "Horizontal Run request name" },
    { "<Leader>rhr", ":hor Rest run<Return>", desc = "Horizontal Run request under the cursor" },
  },
  config = function()
    vim.g.rest_nvim = {
      custom_dynamic_variables = {
        randomInt10 = function()
          return tostring(math.random(1, 10))
        end,
      },
    }
  end,
}
