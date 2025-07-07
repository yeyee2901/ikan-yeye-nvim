-- copied from defaults
return {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "gopls",
      "goimports",
      "gofumpt",
      "elixir-ls",
      "tailwindcss-language-server",
    },
  },
}
