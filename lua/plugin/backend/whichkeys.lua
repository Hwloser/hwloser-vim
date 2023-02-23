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
    }
    wk.register(keymaps)
  end
}
