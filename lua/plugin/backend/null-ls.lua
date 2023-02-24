return {
  "jose-elias-alvarez/null-ls.nvim",
  enabled = false,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- nls.builtins.formatting.prettierd,
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.flake8,
      },
    }
  end,
}
