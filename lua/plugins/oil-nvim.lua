return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      constrain_cursor = "editable",
      prompt_save_on_select_new_entry = true,
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      cleanup_delay_ms = 2000,
      experimental_watch_for_changes = false, -- BUG: expermintal
      columns = { "icon" },

      use_default_keymaps = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },

      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      lsp_file_methods = {
        timeout_ms = 1000,
        autosave_changes = false,
      },

      view_options = {
        show_hidden = false,
        natural_order = true,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },

        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,

        is_always_hidden = function(name, bufnr)
          return name == ".git"
        end,
      },

      -- BUG: experimental support for performing file operations with git
      git = {
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return false
        end,
        rm = function(path)
          return false
        end,
      },

      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        preview_split = "auto",
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end,
      },

      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = { winblend = 0 },
        update_on_cursor_moved = true,
      },

      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },

      -- Extra arguments to pass to SCP when moving/copying files over SSH
      extra_scp_args = {},
      ssh = {
        border = "rounded",
      },

      keymaps_help = {
        border = "rounded",
      },
    },
  },
}
