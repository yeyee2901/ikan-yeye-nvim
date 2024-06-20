return {
  {
    "simondrake/gomodifytags",
    dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    opts = {
      transformation = "camelcase",
      skip_unexported = true,
      override = true,
      options = { "json=omitempty" },
      parse = { enabled = true, seperator = "--" },
    },
  },
}
