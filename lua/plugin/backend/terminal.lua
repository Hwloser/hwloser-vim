require("common.utilities")

return {
  "akinsho/toggleterm.nvim",
  event = "BufWinEnter",
  keys = {
    {
      "<leader>tt",
      "<cmd>ToggleTerm<cr>",
      desc = "Toggle Terminal"
    },
  },
  branch = "main",
  config = function ()
    local term = require("toggleterm")
    term.setup()
  end
}
