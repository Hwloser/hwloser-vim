return {
  "nvim-telescope/telescope-frecency.nvim",
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },
  config = function ()
    require("telescope").load_extension("frecency")
  end,
}
