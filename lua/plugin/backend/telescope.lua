-- fuzzy find_references

require "common.utilities"

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "telescope-fzf-native.nvim" },
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    {
      "gd",
      "<cmd>Telescope lsp_definitions<cr>",
      desc = "Goto Definition",
    },
    {
      "gr",
      "<cmd>Telescope lsp_references<cr>",
      desc = "References",
    },
    {
      "gD",
      vim.lsp.buf.declaration,
      desc = "Goto Declaration",
    },
    {
      "gI",
      "<cmd>Telescope lsp_implementations<cr>",
      desc = "Goto Type Definition",
    },
    {
      "gt",
      "<cmd>Telescope lsp_type)definitions<cr>",
      "Goto Type Definition",
    },
    {
      "K",
      vim.lsp.buf.hover,
      desc = "Hover",
    },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
}
