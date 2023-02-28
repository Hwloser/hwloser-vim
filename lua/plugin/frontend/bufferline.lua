local ci = require("common.icons")

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependeicies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    {
      "<leader>bp",
      "<Cmd>BufferLineTogglePin<CR>",
      desc = "Toggle pin"
    },
    {
      "<leader>bP",
      "<Cmd>BufferLineGroupClose ungrouped<CR>",
      desc = "Delete non-pinned buffers"
    },
    {
      "<leader>bg",
      "<Cmd>BufferLinePick<CR>",
      desc = "Pick a BufferLine"
    },
    {
      "<leader>bn",
      "<cmd>BufferLineCycleNext<cr>",
      desc = "cycle go to next buffer",
    },
    {
      "<leader>bb",
      "<cmd>BufferLineCyclePrev<cr>",
      desc = "cycle go to previous buffer",
    },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = ci.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      },
      separator_style = "slant",
      -- indicator = {
      --   style = "underline",
      -- },
    },
  },
}
