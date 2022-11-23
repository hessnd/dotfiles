local colorizerStatus, colorizer = pcall(require, "colorizer")
if (not colorizerStatus) then return end

local bufDeleteStatus, bufdelete = pcall(require, "bufdelete")
if (not bufDeleteStatus) then return end

local map = require("utils").map


colorizer.setup()

map('n', '<leader>x', function() bufdelete.bufdelete(0, false) end, { desc = "close buffer" })

