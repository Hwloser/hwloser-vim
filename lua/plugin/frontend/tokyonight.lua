-- the colorscheme should be available when starting Neovim

return {
  "folke/tokyonight.nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- use the night style
      style = "night",
      -- disable italic for functions
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      transparent = true,
      terminal_colors = false,
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end
    })
    -- load the colorscheme here
    vim.cmd([[
      colorscheme tokyonight
    ]])
  end
}
