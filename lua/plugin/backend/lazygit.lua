return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  keys = {
    {
      "<leader>gl",
      "<cmd>LazyGit<cr>",
      desc = "LazyGit"
    },
  },
  config = function()
    -- transparency of floating window
    vim.g.lazygit_floating_window_winblend = 0
    -- scaling factor for floating window
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    -- customize lazygit popup window corner characters
    vim.g.lazygit_floating_window_corner_chars = {
      '╭', '╮', '╰', '╯'
    }
    -- use plenary.nvim to manage floating window if available
    vim.g.lazygit_floating_window_use_plenary = 0
    -- fallback to 0 if neovim-remote is not installed
    vim.g.lazygit_use_neovim_remote = 1

    -- config file path is evaluated if this value is 1
    vim.g.lazygit_use_custom_config_file_path = 0
    -- custom config file path
    vim.g.lazygit_config_file_path = ''
  end
}
