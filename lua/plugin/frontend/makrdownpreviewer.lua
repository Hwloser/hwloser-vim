return {
  "iamcco/markdown-preview.nvim",
  lazy = false,
  ft = "makrdown",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_browser = '/Applications/Min.app/Contents/MacOS/Min'
    vim.g.mkdp_page_title = '「${name}$」'
    vim.g.mkdp_theme = 'dark'
  end,
  keys = {
    {
      "<leader>mp",
      "<Plug>MarkdownPreviewToggle<cr>",
      desc = "Previewer"
    },
  },
}
