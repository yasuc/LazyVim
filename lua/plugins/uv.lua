return {
  "benomahony/uv.nvim",
  ft = "python",
  cmd = {
    "UVInit",
    "UVRunSelection",
    "UVRunFunction",
    "UVRunFile",
    "UVAddPackage",
    "UVRemovePackage",
    "UVAutoActivateToggle",
    "UVAutoActivateToggleBuffer",
  },
  opts = { picker_integration = true, keymaps = { prefix = "<leader>V" } },
}
