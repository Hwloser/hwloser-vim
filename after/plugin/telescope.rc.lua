local status, telescope = pcall(require, 'telescope')
if not status then return end
local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extesions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telecsope-file-browser in its place
      mappings = {
        -- your custom insert mode mappings
        ['i'] = {
          ['<C-w>'] = function()
            vim.cmd('normal vbd')
          end
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', ';f', '<cmd>lua require("telescope.builtin").find_files( { no_ignore = false, hidden = true } )<CR>'
  , opts)
vim.keymap.set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<CR>'
  , opts)
vim.keymap.set('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers()<CR>'
  , opts)
vim.keymap.set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<CR>'
  , opts)
vim.keymap.set('n', ';;', '<cmd>lua require("telescope.builtin").resume()<CR>'
  , opts)
vim.keymap.set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostic()<CR>'
  , opts)
vim.keymap.set('n', 'sf',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 }})<CR>'
  , opts)
