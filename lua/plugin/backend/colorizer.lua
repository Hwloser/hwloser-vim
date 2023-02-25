require("common.utilities")

return {
  "norcalli/nvim-colorizer.lua",
  opts = {
  },
  config = function (_, opts)
    require('colorizer').setup()
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
