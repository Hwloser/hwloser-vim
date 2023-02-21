--[[
-- The default maps
--]]

-- 1. Define the default opt action
local default_generic_opts = {
  noremap = true,
  silent = false
}

-- 2. Define default maps
return {
  insert_mode = {
    abbreviation = "i",
    opts = default_generic_opts,
    maps = {

    }
  },

  normal_mode = {
    abbreviation = "n",
    opts = default_generic_opts,
    maps = {
      -- Windows navigation
      ["<C-h>"] = "<C-w>h",
      ["<C-l>"] = "<C-w>l"
    }
  },

  visual_mode = {
    abbreviation = "v",
    opts = default_generic_opts,
    maps = {
      ["<"] = "<gv",
      [">"] = ">gv"
    }
  },

  command_mode = {
    abbreviation = "c",
    opts = default_generic_opts,
    maps = {

    }
  }

}
