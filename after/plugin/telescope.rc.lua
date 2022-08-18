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

local kms = vim.keymap.set
local opts = { noremap = true, silent = true }
-- Find files using Telescope command-line sugar
kms('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
kms('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
kms('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
kms('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
kms('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>', opts)

-- Using lua functions
-- kms('n', ';f', '<cmd>lua require("telescope.builtin").find_files( { no_ignore = false, hidden = true } )<CR>'
--   , opts)
-- kms('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<CR>'
--   , opts)
-- kms('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers()<CR>'
--   , opts)
-- kms('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<CR>'
--   , opts)
-- kms('n', ';;', '<cmd>lua require("telescope.builtin").resume()<CR>'
--   , opts)
-- kms('n', ';e', '<cmd>lua require("telescope.builtin").diagnostic()<CR>'
--   , opts)
-- kms('n', 'sf',
--   '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 }})<CR>'
--   , opts)
