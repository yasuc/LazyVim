local function lsp_names()
  local names = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    names[#names + 1] = client.name
  end
  table.sort(names)
  return #names > 0 and (" " .. table.concat(names, ", ")) or ""
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Preserve LazyVim/Extras sections, including branch, diff and progress.
    vim.list_extend(opts.sections.lualine_x, {
      lsp_names,
      "encoding",
      "fileformat",
      "filetype",
    })
  end,
}
