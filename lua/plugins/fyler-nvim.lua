return {
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    branch = "stable", -- Use stable branch for production
    opts = {
      views = {
        finder = {
          mappings = {
            ["q"] = "CloseView",
            ["<CR>"] = "Select",
            ["<C-t>"] = "SelectTab",
            ["<C-v>"] = "SelectVSplit",
            ["<C-s>"] = "SelectSplit",
            ["-"] = "GotoParent",
            ["="] = "GotoCwd",
            ["."] = "GotoNode",
            ["#"] = "CollapseAll",
            ["<BS>"] = "CollapseNode",
          },
        },
      },
    },
  },
}
