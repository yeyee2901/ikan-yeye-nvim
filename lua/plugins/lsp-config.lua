local set_diagnostic_options = function()
  vim.diagnostic.config({ virtual_text = false, float = { border = "single" } })
end

-- copied from defaults
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
      exclude = {},
    },

    servers = {
      -- NOTE: ccls config
      ccls = {
        init_options = {
          onOpen = 0,
          onChange = 1,
          onSave = 0,
        },
      },

      -- NOTE: gleam configs!
      gleam = {},

      -- NOTE: gopls configs !
      gopls = {
        keys = {
          -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
          { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
        },
        settings = {
          gopls = {
            gofumpt = true,
            completion = {
              usePlaceholders = false,
            },
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              rangeVariableTypes = true,
              parameterNames = true,
              functionTypeParameters = true,
            },
            analyses = {
              unreachable = true,
              unusedparams = true,
              unusedvariable = true,
              shadow = true,
              useany = true,
            },
            usePlaceholders = false,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
    },

    setup = {
      -- NOTE: gopls lsp startup !
      gopls = function(_, _)
        LazyVim.lsp.on_attach(function(client, _)
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end, "gopls")

        set_diagnostic_options()
      end,

      -- NOTE: gleam lsp startup !
      gleam = function(_, _)
        set_diagnostic_options()
      end,

      -- NOTE: ccls
      ccls = function(_, _)
        set_diagnostic_options()
      end,
    },
  },
}
