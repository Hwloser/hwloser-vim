local status, tree = pcall(require, 'nvim-tree')
if not status then return end

tree.setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
    --    mappings = {
    --      list = {
    --        { key = 'u', action = 'dir_up' },
    --      },
    --    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true
  },
})

vim.keymap.set('n', '<space>e', ':NvimTreeFindFileToggle<CR>', { silent = true })

--it' a pain to use
-- autocmd! * <buffer>
-- vim.cmd([[
--   augroup nvim_tree_auto_open
--     autocmd VimEnter *.lua :NvimTreeOpen
--   augroup END
-- ]])
