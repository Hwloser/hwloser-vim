local acc = vim.api.nvim_create_autocmd

---@param name string
local function augroup(name)
  return vim.api.nvim_create_augroup("hwloser_vim" .. name, {
    clear = true -- clear is default true, we define to be clear defination
  })
end

-- 1. Highlight on yank
acc("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end
})

-- 2. Resize the splits when window got resized
acc({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end
})

-- 3. Close some FileType with <q>
acc("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end
})

-- wrap and check for spell in text filetypes
acc("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

