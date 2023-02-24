return {
  "nvim-neorg/neorg",
  -- lazy-load on filetype
  ft = "norg",
  -- custom config that will be executed when loading the plugin
  config = function()
    require("neorg").setup()
  end,
}
