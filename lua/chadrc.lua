-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "nightfox",
  cmp = {
    style = "flat_dark"
  }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.mason = {
  cmd = true,
  pkgs = {
    "lua-language-server", "stylua",
    "html-lsp", "css-lsp" , "prettier",
    "clangd", "clang-format", "black",
    "python-lsp-server", "cpptools",
    "codelldb"
  }
}

return M
