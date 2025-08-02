-- copied from defaults
return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "elixir-ls",
      "flake8",
      "gofumpt",
      "goimports",
      "gopls",
      "lua-language-server",
      "prettier",
      "pyright",
      "shellcheck",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
      "templ",
    },
  },
}
