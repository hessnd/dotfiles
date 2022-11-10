local M = {}

function M.map(mode, keybind, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, keybind, rhs, options)
end

return M
