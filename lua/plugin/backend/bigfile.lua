return {
  "lunarvim/bigfile.nvim",
  config = function()
    pcall(function()
     require("bigfile").config()
    end)
  end,
  event = {
    "FileReadPre",
    "BufReadPre",
    "User FileOpened",
  }
}
