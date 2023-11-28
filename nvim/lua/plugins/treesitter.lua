local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- brew install treesitter

-- local jsx_comment = {
--   __default = '// %s',
--   jsx_element = '{/* %s */}',
--   jsx_fragment = '{/* %s */}',
--   jsx_attribute = '// %s',
--   comment = '// %s',
--   __multiline = '/* %s */',
-- }

local options = {
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "html",
    "css",
    "gitcommit",
    "graphql",
    "json",
    "json5",
    "lua",
    "markdown",
    "markdown_inline",
    "toml",
    "kotlin",
    "vim",
  },
  -- autotag = {
  --   enable = true,
  -- },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = true,
  -- },
}

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }

treesitter.setup(options)
