local status, tree = pcall(require, 'nvim-tree')
if not status then return end

tree.setup({
  sort_by = 'case_sensitive',
  open_on_setup = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = 'p', action = 'dir_up' },
      },
    },
    adaptive_size = true,
    side = 'left',
    signcolumn = 'yes',
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = 'before',
      show = {
        git = true
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  },
  filters = {
    dotfiles = true
  },
})

vim.keymap.set('n', '<space>e', ':NvimTreeFindFileToggle<CR>', { silent = true })

-- auto close, when the last window is NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

--it' a pain to use
-- autocmd! * <buffer>
-- vim.cmd([[
--   augroup nvim_tree_auto_open
--     autocmd VimEnter *.lua :NvimTreeOpen
--   augroup END
-- ]])
