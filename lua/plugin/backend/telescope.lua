-- fuzzy find_references

require "common.utilities"

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
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
      "<leader>ll",
      function()
        local floatConfig = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          scope = "line",
          format = function(d)
            local code = d.code or (d.user_data and d.user_data.lsp.code)
            if code then
              return string.format("%s [%s]", d.message, code):gsub("1. ", "")
            end
            return d.message
          end,
        }
        vim.diagnostic.open_float(0, floatConfig)
      end,
      desc = "Show line diagnostics"
    },
    {
      "<leader>lf",
      function()
        vim.lsp.buf.format({})
      end,
      desc = "Format",
    },
    {
      "K",
      vim.lsp.buf.hover,
      desc = "Hover",
    },
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find Files",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Find Buffers",
    },
    {
      "<leader>ft",
      "<cmd>Telescope grep_string<cr>",
      desc = "Find Text By Grep String",
    },
    {
      "<leader>fr",
      "<cmd>Telescope frecency workspace=CWD<cr>",
      desc = "Find Frecency In Current Working Directory"
    }
  },
  opts = {
    defaults = {
      -- prompt_prefix = " ",
      prompt_prefix = " 🔍 ",
      selection_caret = " ",
      -- file_ignore_patterns = "^external/",
      mappings = {
        i = {
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  config = function(_, opts)
    local t = require("telescope")
    t.setup(opts)
    -- TODO: There will trigger some problems, check it soon
    -- t.extensions.notify.notify(opts)
  end
}
