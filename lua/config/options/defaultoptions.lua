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
}
