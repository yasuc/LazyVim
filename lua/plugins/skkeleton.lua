return {
  "vim-skk/skkeleton",
  keys = {
    { "<C-j>", "<Plug>(skkeleton-enable)", noremap = false, mode = "i" },
    { "<C-j>", "<Plug>(skkeleton-enable)", noremap = false, mode = "c" },
    { "<C-@>", "<Plug>(skkeleton-disable)", noremap = false, mode = "i" },
    { "<C-@>", "<Plug>(skkeleton-disable)", noremap = false, mode = "c" },
  },
  dependencies = { "vim-denops/denops.vim" },
  config = function()
    local dict_dir = vim.fn.stdpath("data") .. "/skk"
    vim.fn.mkdir(dict_dir, "p")
    -- Preserve a previously used personal dictionary, if present.
    local legacy_user_dict = vim.fn.expand("~/.skkeleton")
    local user_dict = vim.fn.filereadable(legacy_user_dict) == 1 and legacy_user_dict
      or (dict_dir .. "/SKK-JISYO.user")
    vim.fn["skkeleton#config"]({
      globalDictionaries = { dict_dir .. "/SKK-JISYO.L" },
      userDictionary = user_dict,
      eggLikeNewline = true,
    })
  end,
}
