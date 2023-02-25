return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>lr",
      function()
        require("inc_rename")
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Rename",
    },
  },
  config = function()
    require("inc_rename").setup()
  end
}
