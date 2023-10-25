return {
  {
    "KeitaNakamura/neodark.vim",
    -- lazy = false,
    config = function(_, _)
      -- require("neodark").setup()
      -- terminal_transparent = 1, -- default: 0
      -- solid_vertsplit = 1, -- default: 0
      -- italics = 1, -- default: 0
      vim.cmd([[
        let g:neodark#terminal_transparent = 1 " default: 0
        let g:neodark#solid_vertsplit = 1 " default: 0
        let g:neodark#italics = 1 " default: 0
      ]])
    end,
  },
}
