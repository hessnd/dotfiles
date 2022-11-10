local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

local options = {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "lua",
    "toml",
    "tsx",
    "json",
    "yaml",
    "css",
    "html",
    -- "comment",
    "graphql",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }

treesitter.setup(options)
