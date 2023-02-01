local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

-- brew install treesitter

local jsx_comment = {
  __default = '// %s',
  jsx_element = '{/* %s */}',
  jsx_fragment = '{/* %s */}',
  jsx_attribute = '// %s',
  comment = '// %s',
  __multiline = '/* %s */',
}

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
    "graphql",
    "kotlin"
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = jsx_comment,
      typescript = jsx_comment,
    }
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }

treesitter.setup(options)
