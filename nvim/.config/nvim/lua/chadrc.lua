-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa",
  theme_toggle = { "kanagawa", "flexoki-light" },

  hl_override = {
  	Comment = { italic = true },
  	["@comment"] = { italic = true },
  },
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.3 },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}
return M
