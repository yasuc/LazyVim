return {
  "pwntester/octo.nvim",
  opts = { enable_builtin = true },
  keys = { { "<leader>O", "<cmd>Octo<cr>", desc = "Octo" } },
  init = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("user_octo_highlights", { clear = true }),
      callback = function()
        vim.api.nvim_set_hl(0, "OctoEditable", { bg = "NONE" })
      end,
    })
  end,
}
