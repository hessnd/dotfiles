local status, nvim_comment = pcall(require, "Comment")
if (not status) then return end

local options = {}

nvim_comment.setup(options)
