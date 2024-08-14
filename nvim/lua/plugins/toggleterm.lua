local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

local map = require("utils").map

toggleterm.setup()

local Terminal = require('toggleterm.terminal').Terminal
-- Install via homebrew: brew install jesseduffield/lazygit/lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

local baseTerm = Terminal:new({
  direction = "horizontal",
})

function _baseTerm_toggle()
  baseTerm:toggle()
end

map('n', '<leader>t', '<Cmd>lua _baseTerm_toggle()<CR>', { noremap = true, silent = true })
map('n', '<leader>gg', '<Cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  -- map('t', '<esc>', [[<C-\><C-n>]], opts)
  map('t', 'jk', [[<C-\><C-n>]], opts)
  map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
