local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local filter = require("lsp.utils.filter").filter
local filterReactDTS = require("lsp.utils.filterReactDTS").filterReactDTS

local mason_registry = require('mason-registry')
local tsserver_path = mason_registry.get_package('typescript-language-server'):get_install_path()

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    silent = true,
    border = "rounded",
  }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }
  ),
  ["textDocument/definition"] = function(err, result, method, ...)
    P(result)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return baseDefinitionHandler(err, filtered_result, method, ...)
    end

    baseDefinitionHandler(err, result, method, ...)
  end,
}

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    if vim.fn.has("nvim-0.10") then
      -- Enable inlay hints
      vim.lsp.inlay_hint.enable(bufnr, true)
    end
  end,
  handlers = handlers,
  root_dir = require('lspconfig.util').root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git", "tsconfig.common.json", vim.fn.getcwd()),
  settings = {
    separate_diagnostic_server = true,
    code_lens = "off",
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
    tsserver_plugins = {
      "@styled/typescript-styled-plugin",
    }
  },
})

