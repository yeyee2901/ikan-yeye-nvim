-- NOTE: Catpuccin Theme
--
-- return {
--   {
--     "catppuccin/nvim",
--     lazy = true,
--     name = "catppuccin",
--     opts = {
--       transparent_background = true,
--       flavour = "mocha",
--       integrations = {
--         aerial = true,
--         alpha = true,
--         cmp = true,
--         dashboard = true,
--         flash = true,
--         gitsigns = true,
--         headlines = true,
--         illuminate = true,
--         indent_blankline = { enabled = true },
--         leap = true,
--         lsp_trouble = true,
--         mason = true,
--         markdown = true,
--         mini = true,
--         native_lsp = {
--           enabled = true,
--           underlines = {
--             errors = { "undercurl" },
--             hints = { "undercurl" },
--             warnings = { "undercurl" },
--             information = { "undercurl" },
--           },
--         },
--         navic = { enabled = true, custom_bg = "lualine" },
--         neotest = true,
--         neotree = true,
--         noice = true,
--         notify = true,
--         semantic_tokens = true,
--         telescope = true,
--         treesitter = true,
--         treesitter_context = true,
--         which_key = true,
--       },
--     },
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

return {
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    tag = "v2.0.1",
    config = function(_, _)
      require("flow").setup({
        theme = {
          style = "dark", --  "dark" | "light"
          contrast = "default", -- "default" | "high"
          transparent = true, -- true | false
        },
        colors = {
          mode = "default", -- "default" | "dark" | "light"
          fluo = "orange", -- "pink" | "cyan" | "yellow" | "orange" | "green"
          custom = {
            -- saturation = "", -- "" | string representing an integer between 0 and 100
            -- light = "", -- "" | string representing an integer between 0 and 100
          },
        },
        ui = {
          borders = "fluo", -- "theme" | "inverse" | "fluo" | "none"
          aggressive_spell = false, -- true | false
        },
      })

      vim.cmd("colorscheme flow")
    end,
  },
}
