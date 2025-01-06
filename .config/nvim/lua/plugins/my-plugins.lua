return {
  { "mg979/vim-visual-multi" },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
      })
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        copy_register = '"+',
      })

      local map = vim.keymap.set
      map("n", "<leader>y", require("osc52").copy_operator, { expr = true, desc = "Copy with OSC52" })
      map("n", "<leader>yy", "<leader>y_", { remap = true, desc = "Copy line with OSC52" })
      map("v", "<leader>y", require("osc52").copy_visual, { desc = "Copy visual selection with OSC52" })
    end,
  },
}
