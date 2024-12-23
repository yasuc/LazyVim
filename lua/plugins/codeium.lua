if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "Exafunction/codeium.vim",
  cmd = {
    "Codeium",
    "CodeiumEnable",
    "CodeiumDisable",
    "CodeiumToggle",
    "CodeiumAuto",
    "CodeiumManual",

    event = "BufEnter",
    keys = {
      -- suggested keymap
      { "<Leader>;", "<Cmd>CodeiumToggle<CR>", noremap = true, desc = "Toggle Codeium active", mode = "n" },
      {
        "<C-g>",
        function()
          return vim.fn["codeium#Accept"]()
        end,
        expr = true,
        mode = "i",
      },
      {
        "<C-u>",
        function()
          return vim.fn["codeium#CycleCompletions"](1)
        end,
        expr = true,
        mode = "i",
      },
      {
        "<C-d>",
        function()
          return vim.fn["codeium#CycleCompletions"](-1)
        end,
        expr = true,
        mode = "i",
      },
      {
        "<C-x>",
        function()
          return vim.fn["codeium#Clear"]()
        end,
        expr = true,
        mode = "i",
      },
    },
  },
}
