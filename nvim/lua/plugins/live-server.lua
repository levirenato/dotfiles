return {
  "barrett-ruth/live-server.nvim",
  build = "pnpm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = true,

  vim.keymap.set("n", "<leader>cws", ":LiveServerStart<CR>", { desc = "start server" }),
  vim.keymap.set("n", "<leader>cwt", ":LiveServerStop<CR>", { desc = "stop server" }),
}
