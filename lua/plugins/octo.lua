return {
  "pwntester/octo.nvim",
  config = function()
    require("octo").setup({ enable_builtin = true })
    vim.cmd([[hi OctoEditable guibg=none]])
  end,
  keys = {
    { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" },
  },
}
