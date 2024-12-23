if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      -- -- file and directory options
      dir_path = "images", ---@type string
      relative_to_current_file = true, --@type boolean
      prompt_for_file_name = false, ---@type boolean
    },
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { ",p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
