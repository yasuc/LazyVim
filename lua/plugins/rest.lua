if true then
  return {}
end
return {
  "rest-nvim/rest.nvim",
  ft = "http",
  cmd = "Rest",
  keys = {
    { "<leader>R", "", desc = "+RestNvim" },
    { "<leader>Rr", "<cmd>Rest run<cr>", desc = "Run request under the cursor" },
    { "<leader>Rl", "<cmd>Rest run last<cr>", desc = "Re-run latest request" },
    { "<leader>Re", "<cmd>Telescope rest select_env<cr>", desc = "Select environment variables file" },
    { "<Leader>Rn", ":Rest run<space>", desc = "Run request name" },
    { "<Leader>Rhn", ":hor Rest run<space>", desc = "Horizontal Run request name" },
    { "<Leader>Rhr", ":hor Rest run<Return>", desc = "Horizontal Run request under the cursor" },
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
