-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "sourcegraph/sg.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("sg").setup()
  end,
}
