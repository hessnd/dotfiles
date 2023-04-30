require("mason-null-ls").setup({
  ensure_installed = {
    -- Opt to list sources here, when available in mason.
  },
  automatic_installation = false,
  automatic_setup = true, -- Recommended, but optional
  handlers = {},
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.codespell.with({
      filetypes = { "markdown", "text" },
    }),
    require("typescript.extensions.null-ls.code-actions"),
  },
})
-- local status, null_ls = pcall(require, "null-ls")
-- if (not status) then return end
--
-- -- Avoid LSP Formatting conflicts
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client)
--       return client.name == "null-ls"
--     end,
--     bufnr = bufnr,
--   })
-- end
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- null_ls.setup {
--   sources = {
--     -- $ npm install -g @fsouza/prettierd
--     null_ls.builtins.formatting.prettierd,
--     -- $ npm install -g eslint_d
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     null_ls.builtins.diagnostics.zsh,
--     -- null_ls.builtins.diagnostics.yamllint
--   },
--   -- Format on Save
--   -- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save#sync-formatting
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           lsp_formatting(bufnr)
--         end,
--       })
--     end
--   end
-- }
--
-- vim.api.nvim_create_user_command(
--   'DisableLspFormatting',
--   function()
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
--   end,
--   { nargs = 0 }
-- )