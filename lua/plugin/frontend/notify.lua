require("common.utilities")

return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Delete all Notifications Which is Showing",
    },
  },
  opts = {
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    if not isPluginExists("noice.nvim") then
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function ()
          vim.notify = require("notify")
        end
      })
    end
  end,
}
