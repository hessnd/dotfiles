local status, jester = pcall(require, "jester")
if (not status) then return end
local map = require("utils").map

jester.setup {}

map("n", "<leader>jr", function() jester.run() end, { desc = "jest run test under cursor"})
map(
  "n",
  "<leader>jf",
  function()
    jester.run_file()
  end,
  { desc = "jest run file" }
)
