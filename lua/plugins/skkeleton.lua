if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "vim-skk/skkeleton",
  keys = {
    { "<C-j>", "<Plug>(skkeleton-enable)", noremap = false, mode = "i" },
    { "<C-j>", "<Plug>(skkeleton-enable)", noremap = false, mode = "c" },
    { "<C-@>", "<Plug>(skkeleton-disable)", noremap = false, mode = "i" },
    { "<C-@>", "<Plug>(skkeleton-disable)", noremap = false, mode = "c" },
  },

  dependencies = {
    "vim-denops/denops.vim",
    -- "Shougo/ddc.vim",
    -- "Shougo/ddc-ui-native",
  },
  config = function()
    vim.fn["skkeleton#config"]({
      globalDictionaries = { "~/.config/eskk/SKK-JISYO.L" },
      eggLikeNewline = true,
    })
    -- vim.fn["ddc#custom#patch_global"]("ui", "native")
    -- vim.fn["ddc#custom#patch_global"]("sources", { "skkeleton" })
    -- vim.fn["ddc#custom#patch_global"]({
    --   sourceOptions = {
    --     ["skkeleton"] = {
    --       mark = "skkeleton",
    --       matchers = {},
    --       sorters = {},
    --       converters = {},
    --       isVolatile = true,
    --       minAutoCompleteLength = 1,
    --     },
    --   },
    -- })
    -- vim.fn["ddc#enable"]()
  end,
}
