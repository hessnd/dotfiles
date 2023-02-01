local colorizerStatus, colorizer = pcall(require, "colorizer")
if (not colorizerStatus) then return end

local bufDeleteStatus, bufdelete = pcall(require, "bufdelete")
if (not bufDeleteStatus) then return end

local fidget_status, fidget = pcall(require, "fidget")
if (not fidget_status) then return end


local map = require("utils").map

-- Colorizer
colorizer.setup({
  css = { rgb_fn = true; };
  'javascript';
  'typescript.tsx';
})

-- BufDelete
map('n', '<leader>x', function() bufdelete.bufdelete(0, false) end, { desc = "close buffer" })

-- Fidget
fidget.setup()

