require("common.utilities")

return {
  "iamcco/markdown-preview.nvim",
  lazy = false,
  ft = "makrdown",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  opts = {
    broswer = '/Applications/Min.app/Contents/MacOS/Min'
  },
  config = function(_, opts)
    vim.g.mkdp_auto_start = 0
    if IsFileExists(opts.broswer) then
      vim.g.mkdp_browser = opts.broswer
    end
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
