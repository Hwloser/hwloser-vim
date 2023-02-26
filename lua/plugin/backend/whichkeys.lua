return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      spelling = true,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    local keymaps = {
      mode = { "n", "v" },
      ["g"] = {
        name = "+goto",
      },
      ["<leader>f"] = {
        name = "+file/find",
      },
      ["<leader>u"] = {
        name = "ui",
      },
      ["<leader>l"] = {
        name = "lsp",
      },
      ["<leader>b"] = {
        name = "buffer"
      },
      ["<leader>m"] = {
        name = "makrdown"
      },
      ["<leader>t"] = {
        name = "terminal"
      },
    }

    wk.register(keymaps)
  end
}
