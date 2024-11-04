if false then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- statusline
local lsp_names = function()
  local clients = vim
    .iter(vim.lsp.get_active_clients { bufnr = 0 })
    :map(function(client)
      if client.name == "null-ls" then
        return ("null-ls(%s)"):format(
          table.concat(
            vim
              .iter(require("null-ls.sources").get_available(vim.bo.filetype))
              :map(function(source) return source.name end)
              :totable(),
            ", "
          )
        )
      else
        return client.name
      end
    end)
    :totable()
  return " " .. table.concat(clients, ", ")
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = {
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            -- color = LazyVim.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            -- color = LazyVim.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            -- color = LazyVim.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            -- color = LazyVim.ui.fg("Special"),
          },
          lsp_names,
          { "encoding" },
          { "fileformat" },
          { "filetype" },
          {
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
      }
    end,
  },
}
