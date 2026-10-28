-- ai.sidekick supplies CLI keys and integration; Copilot handles completion/chat.
return {
  "folke/sidekick.nvim",
  opts = {
    nes = { enabled = false },
    cli = { mux = { enabled = false } },
  },
  keys = {
    { "<Tab>", false, mode = "n" },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick Toggle Claude",
    },
  },
}
