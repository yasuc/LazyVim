return {
  "nvim-mini/mini.surround",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, require("config.emmet-ms"))
  end,
}
