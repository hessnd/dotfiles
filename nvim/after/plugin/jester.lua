local status, jester = pcall(require, "jester")
if (not status) then return end
local map = require("utils").map

local Terminal  = require('toggleterm.terminal').Terminal

jester.setup({
  terminal_cmd = ":ToggleTerm direction=vertical size=60",
  dap = {
    console = Terminal
  }
})

map("n", "<leader>jr", function() jester.run() end, { desc = "jest run test under cursor"})
map(
  "n",
  "<leader>jf",
  function()
    jester.run_file()
  end,
  { desc = "jest run file" }
)
