-- LazyVim provides window navigation, indentation and [d / ]d diagnostics.
local map = vim.keymap.set

map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
map("i", "<C-e>", "<End>", { desc = "End of line" })
map("i", "<C-a>", "<Home>", { desc = "Start of line" })

-- Keep the lightweight single-file runner alongside Overseer's project tasks.
map("n", ",r", "<cmd>Jaq quickfix<cr>", { desc = "Run current file (Jaq)" })

-- Reload using the selected encoding (does not change the file on disk).
map("n", "<leader>Uu", "<cmd>edit ++enc=utf-8<cr>", { desc = "Reload as UTF-8" })
map("n", "<leader>Us", "<cmd>edit ++enc=sjis<cr>", { desc = "Reload as Shift-JIS" })

map("n", "<leader>fh", function()
  Snacks.terminal({ "gh", "dash" })
end, { desc = "gh dash" })

-- Use the same formatter selection as LazyVim's save-time formatting.
map({ "n", "x" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format with LazyVim" })

map("n", "<leader>ghP", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview Git hunk" })
map("n", "<leader>ght", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Git line blame" })
map("n", "<leader>go", "<cmd>Yazi<cr>", { desc = "Yazi current file" })
map("n", "<leader>gO", "<cmd>Yazi cwd<cr>", { desc = "Yazi working directory" })
