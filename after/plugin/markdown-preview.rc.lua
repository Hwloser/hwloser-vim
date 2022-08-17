-- Content from https://github.com/iamcco/markdown-preview.nvim
-- set to 1, nvim will open the preview window after entering the markdown buffer
vim.g.mkdp_auto_start = 1

-- spefify browser to open preview page
vim.g.mkdp_browser = '/Applications/Min.app/Contents/MacOS/Min'

vim.keymap.set('n', '<space>md', ':MarkdownPreviewToggle<CR>', { silent = true })
