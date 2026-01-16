if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "stevearc/oil.nvim",
  opts = {
    -- デフォルト設定をオーバーライド
    default_file_explorer = false,
    columns = {
      "icon",
      "size",
      "mtime",
    },
    -- rclone用の設定
    adapters = {
      ["oil-rclone"] = {
        remote = "Onedrive", -- rcloneで設定したリモート名
      },
    },
    -- キーマッピング
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
