require('base')

require('utils.globals')
require('utils.functions')

require('config.options');
require('config.lazy')
require('config.keymappings')
require('mappings')
require('config.autocmds')

require('lsp.config')
require('lsp.setup')
require('lsp.functions')

require('snippets.react')
