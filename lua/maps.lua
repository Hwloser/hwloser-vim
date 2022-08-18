local keymap = vim.keymap

-- define leader key
vim.g.mapleader = " "

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrenemt
keymap.set('n', '+', '<C-A>')
keymap.set('n', '-', '<C-X>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save file
keymap.set('n', '<C-s>', ':wa<CR>', { silent = true })

-- New tab
keymap.set('n', 'te', ':tabe<CR>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })
-- Move window
-- keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

-- Resize windows
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
