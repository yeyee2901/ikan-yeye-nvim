local set_diagnostic_options = function()
  vim.diagnostic.config({ virtual_text = false, float = { border = "single" } })
end

GOPLS_SETTING = {
  settings = {
    gopls = {
      gofumpt = true,
      completion = {
        usePlaceholders = false,
      },
      codelenses = {
        gc_details = true,
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
        S1001 = true, -- appending multiple slices
        S1016 = true, -- casting identical struct
        SA1002 = true, -- invalid format in time.Parse
        SA1007 = true, -- invalid URL in url.Parse
        SA1014 = true, -- non pointer value passed to Unmarshal / Decode
        SA1017 = true, -- channels used with os/signal should be buffered
        SA1020 = true, -- invalid host:port format in net.Listen related functions
        SA1023 = true, -- disallow modifying buffer in an io.Writer implementation
        SA1026 = true, -- cannot marshal channel / functions
        SA1032 = true, -- wrong order of argument for errors.Is()
        SA4006 = true, -- a value is never checked before overwritten -> possible forgotten dead code
      },
      usePlaceholders = false,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
}

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

      tailwindcss = {
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "assets/tailwind.config.ts",
            "assets/tailwind.config.js",
            "assets/tailwind.config.cjs",
            "assets/package.json",
            ".git"
          )(fname) or vim.fn.getcwd()
        end,
        settings = {
          tailwindCSS = {
            -- docs imply it should be html, js or css, but you can also specify
            -- another "known" language so `heex = "phoenix-heex"` or
            -- `heex = "HTML (EEx)"` also works. I think they just all get
            -- treated as "html" by tailwind (effecting if it looks for class="" for completion triggers)
            -- but could not say for certain.
            includeLanguages = { heex = "html", elixir = "html" },
          },
        },
      },

      -- NOTE: gopls configs !
      gopls = GOPLS_SETTING,
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

      -- NOTE: tailwindcss specific setup
      -- tailwindcss = function()
      --   set_diagnostic_options()
      -- end,
    },
  },
}
