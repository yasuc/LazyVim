if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "brianhuster/autosave.nvim",
  config = function()
    require("autosave").setup({
      enabled = false,
      disable_inside_paths = {},
    })
  end,
}
