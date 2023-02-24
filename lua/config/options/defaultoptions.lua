--[
-- Default options here
--]

return {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = {
    "menuone",
    "noselect"
  },
  conceallevel = 0, -- so taht `` is visible in markdown files
  fileencoding = "utf-8", -- the file encoding
  foldmethod = "expr", -- folding method, which will let treesitter decided, set `manual` for manual operattion
  foldexpr = "nvim_treesitter#foldexpr()", -- set empty will let you decided, there will let treesitter decided folding
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- enable mouse used
  swapfile = false, -- create a swap file
  wrap = true, -- display lines as one long line
  cursorline = true, -- highlight the current line
  smartcase = true, -- smart case
  splitbelow = true, -- force all horizontal splits to go below window
  splitright = true, -- force all vertical splits to go right window
  title = true, -- set the title of window to the value of the window will be set to

  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab

  number = true, -- set numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}

  signcolumn = "yes", -- Keep space for sign test, always show the sign column, otherwise it would shift the text each time

  -- scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
  -- sidescrolloff = 8, -- minimal number of screen lines to keep left and right of the cursor.

  -- showcmd = false,
  -- ruler = false,
  -- laststatus = 3,
}
