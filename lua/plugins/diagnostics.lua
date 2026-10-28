return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    -- lang.markdown already runs markdownlint-cli2 through nvim-lint.
    opts.sources = vim.tbl_filter(function(source)
      return source.name ~= "markdownlint-cli2"
    end, opts.sources or {})
  end,
}
